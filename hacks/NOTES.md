# Changes
## array
=delete `at(size_t)` & `at(size_t) const`
Commented out `at` tests

## variant
=delete `get()`s
refactor every `get<A>(v)` into `*get_if<A>(&v)`
refactor some `get<A>(v).x` into `get_if<A>(&v)->x`
Commented out every `get<A>(move(v))`, as we cannot take the address of an xvalue
Commented out the tests for `get` (changing these would be equivalent to the `get_if` tests)

## optional
- =delete `value()`s

refactor every `opt.value().x` into `opt->x`, with the exception of:
    `move(opt).value().x`, which got refactored to `(*move(opt)).x`
refactor every other `opt.value()` into `*opt` where applicable
commented out tests for the throwing behavior of `opt.value()` 

## string_view

=delete :
- `operator<<`
- `basic_string_view::at`
- `basic_string_view::copy`
- `basic_string_view::substr`
- `basic_string_view::compare(size_type pos1, size_type n1, basic_string_view s);`
- `basic_string_view::compare(size_type pos1, size_type n1, basic_string_view s, size_type pos2, size_type n2);`
- `basic_string_view::compare(size_type pos1, size_type n1, const charT* s);`
- `basic_string_view::compare(size_type pos1, size_type n1, const charT* s, size_type n2);`

Commented out `at` tests
Commented out stream tests for `operator<<`
Removed `operator<<` definition in `ostream` (=deleted in string_view, which previously only declared it)
commented out tests for the deleted `compare`s
commented out `copy` tests
commented out `substr` tests

**NOTE:** `starts_with` and `ends_with` are implemented in terms of deleted `compare` functions
and need to be adjusted accordingly

```cpp
_LIBCPP_CONSTEXPR_AFTER_CXX11 _LIBCPP_INLINE_VISIBILITY
bool starts_with(basic_string_view __s) const _NOEXCEPT
{ return size() >= __s.size() && compare(0, __s.size(), __s) == 0; }
```

is replaced with:

```cpp
_LIBCPP_CONSTEXPR_AFTER_CXX11 _LIBCPP_INLINE_VISIBILITY
bool starts_with(basic_string_view __s) const _NOEXCEPT
{
    return      size() >= __s.size() 
            &&  string_view(data(), data() + __s.size()).compare(__s) == 0;
}
```

```cpp
_LIBCPP_CONSTEXPR_AFTER_CXX11 _LIBCPP_INLINE_VISIBILITY
bool ends_with(basic_string_view __s) const _NOEXCEPT
{ return size() >= __s.size() && compare(size() - __s.size(), npos, __s) == 0; }
```

is replaced with:

```cpp
_LIBCPP_CONSTEXPR_AFTER_CXX11 _LIBCPP_INLINE_VISIBILITY
bool ends_with(basic_string_view __s) const _NOEXCEPT
{ 
    return      size() >= __s.size() 
            &&  std::equal(
                    begin() + (size() - __s.size()),
                    end(),
                    __s.begin()
                );
}
```

One test has been altered to use a `wstring` instead of a `wstring_view`
for an operation on an ostream, requiring `operator<<`


## bitset

=deleted :
`set(size_t,bool)`
`reset(size_t)`
`flip(size_t)`

commented out `flip_one` tests
commented out `reset_one` tests
commented out `set_one` tests
commented out `stream_in` and `stream_out` tests
commented out `to_string` tests

commented out `operator<<` in `ostream`
commented out `operator>>` in `istream`

commented out string ctor tests