require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "Can user own (sell) items" do
        billy = users(:billy)
        johnny = users(:johnny)
        ferrari = items(:ferrari)
        xbox = items(:xbox)

        assert (billy.owns_item?(ferrari)), "billy should own (be selling) ferrari"
        assert (not johnny.owns_item?(ferrari)), "johnny should not own (be selling) the ferrari"
    end
    test "Can user own order" do
        billy = users(:billy)
        johnny = users(:johnny)
        billy_order = orders(:billy_order)

        assert (billy.owns_order?(billy_order)), "billy should own billy_order"
        assert (not johnny.owns_order?(billy_order)), "johnny should not own the billy_order"
    end
    test "Can orders own items" do
        billy = users(:billy)
        johnny = users(:johnny)
        ferrari = items(:ferrari)
        xbox = items(:xbox)
        billy_order = orders(:billy_order)

        assert (not billy_order.owns_item?(xbox)), "billy_order should not own xbox"

        xbox.order_id = billy_order.id

        assert (billy_order.owns_item?(ferrari)), "billy_order should own xbox"
    end
    test "Can users order items?" do
        billy = users(:billy)
        johnny = users(:johnny)
        ferrari = items(:ferrari)
        xbox = items(:xbox)
        billy_order = orders(:billy_order)

        assert (not billy_order.owns_item?(xbox)), "billy_order should not own xbox"

        xbox.order_id = billy_order.id

        assert (billy_order.owns_item?(ferrari)), "billy_order should own xbox"

        xbox.order_id = billy_order.id

        assert (billy_order.owns_item?(ferrari)), "billy_order should own xbox"

        assert (billy_order.owns_ordered_item?(xbox)), "billy should have xbox in one of his orders"
    end
end