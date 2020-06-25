# SUSE's openQA tests
#
# Copyright © 2019 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved. This file is offered as-is,
# without any warranty.

# Summary: The test module creates an encrypted partition with LVM and verifies
# that it is shown in the partitioning list.
# Maintainer: Oleksandr Orlov <oorlov@suse.de>

use parent 'y2_installbase';
use strict;
use warnings FATAL => 'all';
use testapi;

sub run {
    my $partitioner = $testapi::distri->get_partitioner();
    $partitioner->edit_proposal(multiple_disks => 1, is_lvm => 1, is_encrypted => 1);
    $partitioner->get_suggested_partitioning_page()->assert_encrypted_partition_with_lvm_shown_in_the_list();
}

1;
