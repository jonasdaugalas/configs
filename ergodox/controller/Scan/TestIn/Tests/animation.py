#!/usr/bin/env python3
'''
Basic animation test case for Host-side KLL
'''

# Copyright (C) 2016-2017 by Jacob Alexander
#
# This file is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file.  If not, see <http://www.gnu.org/licenses/>.

### Imports ###

import interface as i

from common import (ERROR, WARNING, check, result)



### Test ###

# Reference to callback datastructure
data = i.control.data

# Drop to cli, type exit in the displayed terminal to continue
#i.control.cli()

print("-Pixel Test-")

# Read status of animation display buffers
#print( i.control.cmd('animationDisplayBuffers')() )
i.control.cmd('rectDisp')()

# Add Animation, index 3, to Stack (testanimation)
i.control.cmd('addAnimation')(name='testanimation')

# Read animation stack info
print( "Expecting Stack Size: 1 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 1 )

# Loop once
i.control.loop(1)

# Check Pixel 1
expecting = ((16, 0, 32), (30, 70, 120))
print( "Expecting:", expecting, "Got:", i.control.cmd('readPixel')(1) )
check( i.control.cmd('readPixel')(1) == expecting )
i.control.cmd('rectDisp')()

# Update FrameState and Loop again
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Check Pixel 1
expecting = ((16, 0, 32), (0, 0, 0))
print( "Expecting:", expecting, "Got:", i.control.cmd('readPixel')(1) )
check( i.control.cmd('readPixel')(1) == expecting )
i.control.cmd('rectDisp')()

# Update FrameState and Loop again
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Check Pixel 1
expecting = ((16, 0, 32), (60, 90, 140))
print( "Expecting:", expecting, "Got:", i.control.cmd('readPixel')(1) )
check( i.control.cmd('readPixel')(1) == expecting )
i.control.cmd('rectDisp')()

# Update FrameState and Loop again to clear the stack
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Read status of animation display buffers
#print( i.control.cmd('animationDisplayBuffers')() )

# Read animation stack info
print( "Expecting Stack Size: 0 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 0 )


##### Next Test #####


print("-Rainbow Test-")
# Add Animation, index 2, to Stack (rainbow_static_fill_interp)
i.control.cmd('addAnimation')(name='rainbow_static_fill_interp', pfunc=1)

# Read animation stack info
print( "Expecting Stack Size: 1 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 1 )

# Loop once
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Show output
i.control.cmd('rectDisp')()

# Update FrameState and Loop again to clear the stack
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Read animation stack info
print( "Expecting Stack Size: 0 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 0 )


##### Next Test #####


print("-Clear ScanCode Test-");
# Add Animation, index 1, to Stack (clear_pixels)
i.control.cmd('addAnimation')(name='clear_pixels')

# Read animation stack info
print( "Expecting Stack Size: 1 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 1 )

# Loop once
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Show output
i.control.cmd('rectDisp')()

# TODO Check that pixels were cleared

# Update FrameState and Loop again to clear the stack
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Read animation stack info
print( "Expecting Stack Size: 0 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 0 )


##### Next Test #####


print("-Color Fill Test-");
# Add Animation, index 0, to Stack (blue_fill_interp)
i.control.cmd('addAnimation')(name='blue_fill_interp', pfunc=1)

# Read animation stack info
print( "Expecting Stack Size: 1 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 1 )

# Loop once
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Show output
i.control.cmd('rectDisp')()

# Update FrameState and Loop again to clear the stack
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Read animation stack info
print( "Expecting Stack Size: 0 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 0 )


##### Next Test #####


print("-Fade In Test-");
# Add Animation, index 4, to Stack (fade_in)
i.control.cmd('addAnimation')(name='fade_in', pfunc=1) # TODO

# Loop 16 times, displaying each time
for index in range( 27 ):
    # Read animation stack info
    print( "Loop {0} - Expecting Stack Size: 1 Got: {1}".format( index, i.control.cmd('animationStackInfo')().size ) )
    check( i.control.cmd('animationStackInfo')().size == 1 )

    # Loop once
    i.control.cmd('setFrameState')(2)
    i.control.loop(1)

    # Show output
    i.control.cmd('rectDisp')()

# Loop one more time to clear stack
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Read animation stack info
print( "Final - Expecting Stack Size: 0 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 0 )


##### Next Test #####


print("-Rainbow Animation Test-");
# Add Animation, index 5, to Stack (z2_rainbow_fill_interp)
i.control.cmd('addAnimation')(name='rainbow_fill_interp', pfunc=1) # TODO

# Loop 40 times, displaying each time
for index in range( 40 ):
    # Read animation stack info
    print( "Loop {0} - Expecting Stack Size: 1 Got: {1}".format( index, i.control.cmd('animationStackInfo')().size ) )
    check( i.control.cmd('animationStackInfo')().size == 1 )

    # Loop once
    i.control.cmd('setFrameState')(2)
    i.control.loop(1)

    # Show output
    i.control.cmd('rectDisp')()

# Loop one more time to clear stack
i.control.cmd('setFrameState')(2)
i.control.loop(1)

# Read animation stack info
print( "Final - Expecting Stack Size: 0 Got:", i.control.cmd('animationStackInfo')().size )
check( i.control.cmd('animationStackInfo')().size == 0 )


##### Tests Complete #####

result()

