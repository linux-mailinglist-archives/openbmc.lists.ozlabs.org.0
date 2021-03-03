Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5AC32ACCD
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 02:49:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqxl15Wdbz3cV7
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 12:49:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KUVCSrMf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KUVCSrMf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqxkp5rWMz30Mt
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 12:49:38 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1231iE3H155156
 for <openbmc@lists.ozlabs.org>; Tue, 2 Mar 2021 20:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=j4HA+egL+qM8I70DTigEDPBCwf0gBLbZD2Mhv5IF2QY=;
 b=KUVCSrMfZlKcW3BhGlk82yl+h0ZmFu+I2+LTDax0rZgGlx3ou0a1aafIUPE7W/goIGaw
 SowQN50JYTTpPs8RRzTFOc4DDcFfB9IGZHuii0GU2a4NNumE9AQ99DSct3VGBsEI9h+N
 SpqhuehTZjkI/vzwvc4T2BfMn+4VsV0LwKwEkB22cMt5aDnJ+42qZ18Eer6QM1g8R6BF
 aQMP34HaETO3IwBP+GXH+g/1Ed4x1LFpM/t8hJBHIkUHWLeKrW2IlcPTvfzjyJlefZ6s
 ZeMM3zaL2nkZQ97/dtRoKcqe7PbNEy0Ei+dStHiAHgms1f9EWAnwL6/uy+/7a0DDGUn2 2w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37212485ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Mar 2021 20:49:35 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1231mZWS021137
 for <openbmc@lists.ozlabs.org>; Wed, 3 Mar 2021 01:49:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3710sqqhau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Mar 2021 01:49:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1231nXE522610362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 3 Mar 2021 01:49:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 858687805E
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 01:49:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4866F7805C
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 01:49:33 +0000 (GMT)
Received: from demeter.local (unknown [9.65.202.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 01:49:33 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group - Wednesday March 3
Message-ID: <1a90e8cb-82a2-7c9e-049f-48bfd7121fa2@linux.ibm.com>
Date: Tue, 2 Mar 2021 19:49:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 mlxlogscore=742
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030008
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

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday March 3 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

1. BMC threat modeling from physical interfaces.

2. Email to remove overlayfs & associated risks.

3. Enhance phosphor-user-manager to signal for password changes.

Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>
