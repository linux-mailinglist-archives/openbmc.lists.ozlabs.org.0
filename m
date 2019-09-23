Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5251BB7F4
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 17:31:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cSwg2Gm5zDqHx
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 01:31:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cSsq514bzDqJR
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 01:29:18 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NFRCHK059004; Mon, 23 Sep 2019 11:29:10 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v6yqxjsvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 11:29:10 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NFAM5C032150;
 Mon, 23 Sep 2019 15:29:09 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2v5bg71j72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 15:29:09 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NFT8X713959836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 15:29:08 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8164028060;
 Mon, 23 Sep 2019 15:29:08 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 570212805E;
 Mon, 23 Sep 2019 15:29:08 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 23 Sep 2019 15:29:08 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Proposal to merge code into openbmc 2.7 warrior branch
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <586101dc-f7bd-37f8-9377-0ecbb3d4fc88@linux.ibm.com>
Date: Mon, 23 Sep 2019 10:29:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230146
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This proposal is to merge code into the [OpenBMC 2.7 warrior fix 
branch][].  There are three sets of changes:
1. Refresh our warrior branch with fixes from the yocto warrior branch.
2. Customize SSH ciphers to harmonize with our HTTPS ciphers.
3. Pick up a fix to make it easier to downgrade to earlier releases.

Details for each of these are below.  Can we get these merged?

References:
- [OpenBMC 2.7 warrior fix branch]: 
https://github.com/openbmc/openbmc/tree/warrior
- [release notes]: 
https://github.com/openbmc/docs/blob/master/release/release-notes.md


- Joseph



1. Pick up fixes from yocto branch=warrior.  This has security fixes 
that we should pick up.


2. Pick up the [SSH dropbear patch] to disable medium strength ciphers 
which brings SSH close to parity with [BMCWeb HTTPS ciphers][].  
Specifically, it removes medium strength ciphers, leaving only strong 
ciphers  (Note that BMCWeb offers additional strong HTTPS ciphers which 
our Dropbear SSH server does not yet support.)  This change is in the 
yocto master branch, so it is the new behavior going forward, but was 
not accepted into yocto branch=warrior because it is a configuration 
change and not a fix. We consider this to be a security fix.  We should 
pick it up to match the ciphers accepted by our HTTPS server.

References:
- [SSH dropbear patch]: 
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch?h=master
- [BMCWeb https config]: 
https://github.com/openbmc/bmcweb/blob/27062605f8ddbafeec691ed9556fe90f2c1ab8d2/include/ssl_key_handler.hpp


3. Pick up the [nginx patch][] to mitigate a problem downgrading from 
2.7 to earlier releases.  The underlying [nginx downgrade issue][] is in 
OpenBMC, so that's where the fix should go.  This should be merged into 
openbmc master branch first, then picked up by branch=warrior.

Refernces:
- [nginx patch]: 
https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/23203
- [nginx downgrade issue]: https://github.com/openbmc/openbmc/issues/3564

