Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5846F9D81
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 23:53:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CNMl69n7zF3NT
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 09:53:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CNLY5gx4zF42k;
 Wed, 13 Nov 2019 09:52:52 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xACMqIAq088144; Tue, 12 Nov 2019 17:52:49 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w7qdc9bj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 17:52:48 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xACMoh4V030401;
 Tue, 12 Nov 2019 22:52:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 2w5n36avwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 22:52:48 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xACMqll656426988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 22:52:47 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C02C136051;
 Tue, 12 Nov 2019 22:52:47 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15DB113604F;
 Tue, 12 Nov 2019 22:52:46 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 12 Nov 2019 22:52:46 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Nov 2019 16:54:22 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: Packaging and deploying multiple firmware image types in one
In-Reply-To: <20191112074921.GA4938@bbwork.lan>
References: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
 <20191112074921.GA4938@bbwork.lan>
Message-ID: <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911120197
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-11-12 01:49, Alexander A. Filippov wrote:
> On Mon, Nov 11, 2019 at 01:28:11PM -0600, Adriana Kobylak wrote:
> 
> We use the system bundle of BMC + Host firmware on our VESNIN hardware.

How are you currently building the bundled image, do you include the 
Host firmware in the BMC rootfs, or do you have separate image files 
(bmc fw file, host fw file) in a single tarball?

> There are some things which cause discomfort a little bit:
> - The uploaded system bundle isn't shown in the WebUI.
> - The system bundle has only one version field which is common for BMC 
> and Host
>   firmwares.

Do you think the ExtendedVersion d-bus property could help in this case? 
For example adding to the manifest "extended_version=host-v1.2."

> - After rebooting BMC, which is required to complete update the BMC 
> firmware
>   the system bundle turns to two separated instances in D-Bus which has 
> its own
>   real versions.

Yeah, the purpose is not currently preserved across reboots. I have a 
change here for that: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/27045

> 
> Thus, I thought about putting the separate manifests for each part of 
> the
> bundle.

If you go the route of adding a second manifest, would you have them in 
a separate tarball (bmc image + manifest) and (host image + manifest) 
then put those tarballs inside a tarball? since the manifest file name 
would be the same.

> 
>> 
>> ---
>> [1] https://lists.ozlabs.org/pipermail/openbmc/2019-June/016573.html
>> [2] 
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Version.interface.yaml
>> [3] 
>> https://github.com/openbmc/meta-openpower/blob/master/recipes-phosphor/flash/host-fw_git.bb
>> [4] 
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/ExtendedVersion.interface.yaml
