Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E401136D7
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 21:59:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Srn05zmgzDqVr
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 07:59:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SrmH6Zj5zDqSy
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 07:58:23 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 12:57:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="219022669"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 12:57:08 -0800
Date: Wed, 4 Dec 2019 12:57:06 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Devender Rao <devenrao@in.ibm.com>
Subject: Re: phosphor logging
Message-ID: <20191204205506.GA9613@mauery.jf.intel.com>
References: <CAMpjGno21Fff20TqWS1jaW3x5_HDF4D+pTqz=coSgh8YwRzq3w@mail.gmail.com>
 <OF0E392E90.A95260BC-ON002584BF.001C34AB-002584BF.001C44A9@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <OF0E392E90.A95260BC-ON002584BF.001C34AB-002584BF.001C44A9@notes.na.collabserv.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, ckimchan17@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27-Nov-2019 05:08 AM, Devender Rao wrote:
>try "journalctl -o json-pretty > /tmp/logfile" and in the log file search for "
>HASSIS_REQUESTED_POWER_STATE"

I created a little script because I wanted to see all the stuff getting 
logged in ipmi land. This could be generalized, but maybe not automated 
for any set of repos.

This script creates a script that can then be run on the BMC, and only 
prints the fields you care about rather than all the fields from 
verbose printing.

--Vernon

======================8<----------------------
#!/bin/sh

cat <<EOF
#!/bin/sh
F=MESSAGE,SYSLOG_IDENTIFIER
EOF
for P in phosphor-host-ipmid phosphor-net-ipmid kcsbridge; do
        (
                cd $P
                # find entry("<F>") and split them out
                git grep '\<entry("' | sed 's/\(\<entry("[^)]*\)/\1\n/g' |
                        grep 'entry' | sed 's/.*entry("\([-_A-Z0-9]*\).*/F=$F,\1/ig'
        )
done | sort | uniq
cat <<EOF
T="-t ipmid"
T="\$T -t netipmid -t netipmid-eth0 -t netipmid-eth1"
T="\$T -t kcsbridged -t kcsbridged-ipmi-kcs3 -t kcsbridged-ipmi-kcs4"

journalctl -f -o verbose -p 7 \$T --output-fields=\$F | \\
        sed 's/\(^[^\s].*UTC\).*/\1/'
EOF
