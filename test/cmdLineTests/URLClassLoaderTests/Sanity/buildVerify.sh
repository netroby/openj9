#!/bin/sh

#
# Copyright (c) 2001, 2017 IBM Corp. and others
#
# This program and the accompanying materials are made available under
# the terms of the Eclipse Public License 2.0 which accompanies this
# distribution and is available at https://www.eclipse.org/legal/epl-2.0/
# or the Apache License, Version 2.0 which accompanies this distribution and
# is available at https://www.apache.org/licenses/LICENSE-2.0.
#
# This Source Code may also be made available under the following
# Secondary Licenses when the conditions for such availability set
# forth in the Eclipse Public License, v. 2.0 are satisfied: GNU
# General Public License, version 2 with the GNU Classpath
# Exception [1] and GNU General Public License, version 2 with the
# OpenJDK Assembly Exception [2].
#
# [1] https://www.gnu.org/software/classpath/license.html
# [2] http://openjdk.java.net/legal/assembly-exception.html
#
# SPDX-License-Identifier: EPL-2.0 OR Apache-2.0
#

# ensure the new jar files are not created in the same second as the originals,
# otherwise the shared cache will not be able to determine the jar files have
# been modified
sleep 2
$1/javac Sanity/VerifyClasses/jnurlcldr/shared/sanity/*.java
cd Sanity/VerifyClasses
mkdir ../ExtDir
$1/jar -cvf ../A.jar jnurlcldr/shared/sanity/A_Data.class jnurlcldr/shared/sanity/A_Main.class
$1/jar -cvf ../ExtDir/A_Ext.jar jnurlcldr/shared/sanity/A_ExtDummy.class jnurlcldr/shared/sanity/A_ExtData.class
cd ../
ls *.jar
cd ../