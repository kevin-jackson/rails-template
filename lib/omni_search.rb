class OmniSearch

  attr_reader :search_term, :attribute_definitions

  # @param search_term [String]: The search term to apply to use for the given attributes
  # @param attribute_definitions [Hash]: A hash of attributes that should be searched on,
  #   paired as {attribute_name: type}. Supported types are:
  #     * string
  def initialize(search_term, attribute_definitions)
    @search_term = search_term
    @attribute_definitions = attribute_definitions
  end

  # Given a search_term (EG: "Jordan"), apply search conditions for a set of given attribute_definitions
  # to a scoped collection (initial_scope).
  #
  # @param initial_scope [ActiveRecord::Relation]: The scoped objects to perform the search on
  # @return [ActiveRecord::Relation]: The initial_scope with the search term applied to it.
  def apply_scope_to(initial_scope)
    scoped_collection = initial_scope
    attribute_definitions.each do |attribute, attribute_type|
      scoped_collection = scope_collection_by_type(scoped_collection, attribute, attribute_type)
    end
    scoped_collection
  end

private

  def sanitize_attribute_name(scoped_collection, attribute)
    if scoped_collection.column_names.include?(attribute.to_s)
      attribute
    else
      raise(ArgumentError, "unknown attribute passed: #{attribute}. Expecting one of: #{scoped_collection.column_names.to_sentence}")
    end
  end

  # WHERE email ILIKE %Jordan%
  def scope_collection_by_string(scoped_collection, attribute)
    scoped_collection.where("#{sanitize_attribute_name(scoped_collection, attribute)} ILIKE ?", "%#{search_term}%")
  end

  def scope_collection_by_type(scoped_collection, attribute, attribute_type)
    case attribute_type.to_sym
    when :string
      scope_collection_by_string(scoped_collection, attribute)
    else
      raise(ArgumentError, "unhandled search type: #{attribute_type}")
    end
  end

end
