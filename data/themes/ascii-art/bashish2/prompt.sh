#!/bin/sh
##################################################################################
## Copyright (c) 2006, Thomas Eriksson
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without 
## modification, are permitted provided that the following conditions 
## are met:
##
## * Redistributions of source code must retain the above copyright notice, 
##   this list of conditions and the following disclaimer.
## * Redistributions in binary form must reproduce the above copyright notice,
##   this list of conditions and the following disclaimer in the documentation
##   and/or other materials provided with the distribution.
## * Neither the name of the Bashish project nor the names of its contributors 
##   may be used to endorse or promote products derived from this software 
##   without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
## AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
## ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
## LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
## CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
## SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
## INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
## CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
## ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
## THE POSSIBILITY OF SUCH DAMAGE.
##
##################################################################################
##
## Bluesteel by arnognulf
##
###########################

## mash up this function to not use bash string manipulation
## if DIRELEMENT1 = PWDELEM1
_bashish_prompt ()
{
eval $(_bashish_prompt_shellvars $SHELLNAME)
eval $(_bashish_prompt_parsecolors "$@")
test "x${BASHISH_COLOR0}" = x && eval $(_bashish_prompt_parsecolors white)

$_typeset FADE1="${ESC}[32m"
$_typeset BASHISH_C4=`_bashish_prompt_cp437 C4`
$_typeset BASHISH_DA=`_bashish_prompt_cp437 DA`
$_typeset BASHISH_C0=`_bashish_prompt_cp437 C0`
$_typeset LINE=`_bashish_prompt_fillx $BASHISH_C4`
$_typeset BASHISH_CWD=`_bashish_prompt_cwd "\\[\033[1;3${BASHISH_COLOR0}m\\]" "\\[\033[2m\\]" 39`

test "x${PROMPTSTR}" = x && $_typeset PROMPTSTR="$USER"

PS1="[47;90;7m`_bashish_prompt_fillx \" \" $(expr ${#HOSTNAME} + ${#PROMPTSTR} + 7)`${PROMPTSTR}  [0;7;1m  ${HOSTNAME}   
\[[0m\] ${BASHISH_CWD}\[[0m\] "'$(__git_ps1 "[1m|[0m%s[1m|[0m ")'
}
