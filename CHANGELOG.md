# Changelog
## Version 1
### 1.1.1
* Now licensed with the MIT license.

### 1.1.0
* Remove specs from gem build.
* Changes to Triplet and Pair alike:
  * Contents (left, right, middle) are all now reader attributes. However, they can still be assigned and modified using the same = syntax.
  * New @frozen instance variable in Triplet and Pair.
  * New custom `#eql?`/`#==` methods for proper equivalency checks.
  * New `#frozen?` method to check if the object is frozen.
  * New `#freeze` to freeze the object, as well as its left, right, and middle values.
  * New `#left=`, `#right=`, and `#middle=` methods that raise a RuntimeError if the object is frozen.
  * New `#clone` method for proper mutability/pointers.

### 1.0.0
* Initial release.