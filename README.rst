timestring
==========

Converting strings into usable time objects. The time objects, known as
``Date`` and ``Range`` have a number of methods that allow you to easily
change and manage your users input dynamically.

This is a fork of the work done by Steve Peak, his original code can be
found at http://github.com/stevepeak/timestring.

Install
-------

``pip install timestring-pleasantone``

Ranges
------

Ranges are simply two Dates. The first date, ``Range().start`` and
``Range().end`` represent just that, a start and end to a period of
time. There are a couple reference points for Ranges.

References
^^^^^^^^^^

-  **no reference** => ``x[ - - - - ]``

   -  Adds the time to today. ``Range('1 week')`` would be
      ``today + 7 days``

-  ``this`` => ``[ - - x - - ]``

   -  ``this month`` is from start of month to end of month. Therefore
      today **is** included.
   -  ``Range("today") in Range("this month") == True``

-  ``next`` => ``x [ - - - - ]``

   -  ``next 3 weeks`` takes today and finds the start of next weeks and
      continues to contain 3 weeks.
   -  ``Range("today") in Range("next 5 days") == False`` and
      ``Range("tomorrow") in Range("next 5 days") == True``

-  ``ago`` => ``[ - - - - ] x``

   -  same as ``next`` but in the past

-  ``last`` => ``[ - - - - x ]``

   -  ``last 6 days`` takes all of Today and encapsulates the last 6
      days
   -  ``Range("today") in Range("last 6 days") == True``
   -  empty reference ex ``10 days``

Samples
^^^^^^^

The examples below all work with the following terms ``minute``,
``hour``, ``day``, ``month`` and ``year`` work for the examples below.
fyi ``Today is 5/14/2013``

    ``this`` will look at the references in its entirety

.. code:: python

    >>> Range('this year')
    From 01/01/13 00:00:00 to 01/01/14 00:00:00

*Notice how this year is from jan 1s to jan 1st of next year* The full
year, all 12 months, is **this year**

    ``ago`` and ``last`` will reference in the past

.. code:: python

    >>> Range('1 year ago')
    From 01/01/11 00:00:00 to 01/01/12 00:00:00

``1 year ago`` is equivalent to ``year ago``, and ``last year``

*Note* you add more years like this ``5 years ago`` which will be
``From 01/01/07 00:00:00 to 01/01/08 00:00:00``

See examples see the `test file`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

More examples / documentation coming soon.

License
-------

**timestring** is licensed under the Apache Licence, Version 2.0
(http://www.apache.org/licenses/LICENSE-2.0.html).

.. _test file: https://github.com/pleasantone/timestring/blob/master/tests/tests.py

.. |Build Status| image:: https://secure.travis-ci.org/pleasantone/timestring.png
   :target: http://travis-ci.org/pleasantone/timestring
.. |Version| image:: https://pypip.in/v/timestring-pleasantone/badge.png
   :target: https://github.com/pleasantone/timestring
.. |codecov.io| image:: https://codecov.io/github/pleasantone/timestring/coverage.svg?branch=master
   :target: https://codecov.io/github/pleasantone/timestring
