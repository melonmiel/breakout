# A List is a collection of selectable items
# Think "linked list"
# TODO: Ensure instances entiring the list
#  respond to `selected?`
class List < Array

  def initialize(*items)
    items.each { |item| self << item }
    first.select! if length > 0
  end

  def previous
    cycle(-1)
  end

  def next
    cycle(+1)
  end

  def cycle(offset = +1)
    next_index = current_index + offset
    next_index = 0 if next_index >= length
    next_item = self[next_index]
    each(&:unselect!)
    next_item.select!
  end

  def current
    find(&:selected?)
  end

  private

  def current_index
    index(current)
  end
end
