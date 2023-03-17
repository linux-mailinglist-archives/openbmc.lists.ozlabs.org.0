Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7884A6BDD91
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 01:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pd4fy237wz3cjQ
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 11:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UO5Sreqm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UO5Sreqm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pd4fG45Cbz3bjb
	for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 11:25:26 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GMnLOF009230
	for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 00:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=J0E1UAU3ZdpA89g9Zz/KQBZC3s/551R7HFOhRVeHtRs=;
 b=UO5SreqmjwSGAKxj42HgsP6ViFHtaKzHaCFsxxFxSExSdGeD3ErUuKr8YcEWdiSDtwzd
 Xh2ICsg1AUaaLwznFnyMosydAJgHdCmdDj+1HNAbQHna6Yc7UOrPvHwqU3at1HyCDo/g
 sVCfQuK1kPTlWC+7Pk7Vp/U2N0k57g2dR/Izx3cgFO7Ktnmj+wiOS6ESEoANb8L6M97w
 hXXqJ/MI9t1r2kFLgNHvrp60Jdp8znl9r3Pp7DIzKllx4uPC9QqHpfQWU3dqxr27W/pk
 bH4cVikvspLEuLEXUcP3LS8NE71h8SKc0vtiM0F0YMICCFtIs7ROHwBWGhXRs7L9NJjT ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcc8a9qsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 00:25:22 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32H0Ine0011615
	for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 00:25:22 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcc8a9qs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 00:25:21 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GMNDZt002877;
	Fri, 17 Mar 2023 00:25:21 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3pbs535pck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 00:25:21 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32H0PKaD30540498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Mar 2023 00:25:20 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F259358059;
	Fri, 17 Mar 2023 00:25:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A22015805D;
	Fri, 17 Mar 2023 00:25:19 +0000 (GMT)
Received: from [9.160.30.16] (unknown [9.160.30.16])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 17 Mar 2023 00:25:19 +0000 (GMT)
Message-ID: <9ca949cc-17e4-cacf-50da-22780ba1e762@linux.ibm.com>
Date: Thu, 16 Mar 2023 19:25:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Howto Add A Single File To evb-ast2500 rootfs
Content-Language: en-US
To: David Bashaw <theactualdbashaw@gmail.com>, openbmc@lists.ozlabs.org
References: <CAB7+d-n1ZW4ZAvUZUXdtG1XfSwjajJ4_YNmqAbu98FMui4=q2g@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CAB7+d-n1ZW4ZAvUZUXdtG1XfSwjajJ4_YNmqAbu98FMui4=q2g@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bk98FfxUNmiRqBGqqhtxS0n2PXkeuWJp
X-Proofpoint-GUID: OS3AHArIr0oZ5FEaKPCwZ05RVTW3Yysz
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1011 mlxlogscore=734
 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160180
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

On 3/16/23 1:37 PM, David Bashaw wrote:
> I am new to Yocto and am trying to figure out how to add a simple 
> shell script to the rootfs bin directory with no luck so far. Tried 
> adding a .bbappend file but got warnings about that. How can I add 
> this file for evb-ast2500 target? /DJ
> ZjQcmQRYFpfptBannerStart
> This Message Is From an Untrusted Sender
> You have not previously corresponded with this sender.
> ZjQcmQRYFpfptBannerEnd
> I am new to Yocto and am trying to figure out how to add a simple 
> shell script to the rootfs bin directory with no luck so far.
>
> Tried adding a .bbappend file but got warnings about that.
> How can I add this file for evb-ast2500 target?

Here is an example from a current gerrit review how to add a file to the 
BMC's readonly file system.  I think this is the right pattern.
https://gerrit.openbmc.org/c/openbmc/openbmc/+/61582/5/meta-phosphor/recipes-phosphor/users/phosphor-user-manager_git.bb

This recipe change adds file upgrade_hostconsole_group.sh into the BMC's 
readonly file system as /bin/upgrade_hostconsole_group.sh.
That shell program is then used by the user manager service, per changes 
here:
https://gerrit.openbmc.org/c/openbmc/openbmc/+/61582/5/meta-phosphor/recipes-phosphor/users/phosphor-user-manager/xyz.openbmc_project.User.Manager.service

Joseph

>
> /DJ

