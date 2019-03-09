function b = sort_b_like_a(a, b)
   [~, a_idx] = sort(a);
   b_sorted=sort(b);
   b(a_idx)=b_sorted;
end

