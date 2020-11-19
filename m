Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3A2B8A72
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 04:40:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc5762fPwzDqdk
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 14:40:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ANbO2v1S; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc56830G5zDqcQ
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 14:39:58 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ3Vep8014125; Wed, 18 Nov 2020 22:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=+3Mi086ZDsjfP21YXR0jJ468vLyFYtrOqTTmHNaT7sk=;
 b=ANbO2v1SGlaElCAVp22ToX7Z2Q7hFV76DqC6ieKz386PyXQU60IfV2O61CZHNTXTZkJx
 i59gpFeOWGM2+6VYMicudWGfWUhEFl725S2Ih68TATx4I3wKoWrfOSn0BSZYrWoUqwfM
 w+3zADjSOcF+U1CsfqceC1KXxKpYYX51TB16FSqFykw55p3lTobvnK1bByDLs848K0LH
 pbPPeJMaA/DfJrkykPeyXJp7zg9kQa6QlCe3JIj5uXKrpzAh4/BvYZthni1zKrL3wemN
 d7DNd4xjVjJCwHh1nf3kcE54LqucW9rCbbbvbfKXJr3iiKggmlwy/PGxOws603LTaWxM Sw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg61s5mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 22:39:54 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ3SSGB013417;
 Thu, 19 Nov 2020 03:39:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 34t6v9b5ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 03:39:53 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJ3drXA8061568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 03:39:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A914112062;
 Thu, 19 Nov 2020 03:39:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC0A4112061;
 Thu, 19 Nov 2020 03:39:52 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 03:39:52 +0000 (GMT)
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 21:39:52 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Subject: Re: [Test Automation] [Update Sevice] Failed: Test Firmware Tftp
 Upload Image.Install Same Image Two Times
In-Reply-To: <HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
References: <HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
Message-ID: <b9c6f22a5a0f0054f864ebcc2fb281ec@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_10:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1031
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190021
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
Cc: openbmc@lists.ozlabs.org, anoo@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-11-18 19:51, CS20 CHLi30 wrote:
> 
> Recently, we met 1 test item fail "Test Firmware Tftp Upload
> Image.Install Same Image Two Times" in Update Service of OpenBMC Test
> Automation.

> According your commit, I understand this is a good fix to clear no use
> image files in /tmp folder.
> 
> But, it seems against test item of update service in openbmc test
> automation.
> 
> The test script will check if the existing firmware is functional
> according image_id in /tmp folder, if existing then it's not allow to
> update same image two times.
> 
> However, after your commit then test script will fail due to image_id
> dir be deleted. Did you have any suggestion for this symptom?

Hi Tim,

Could you provide a bit more details about this test case, you hint that 
it may exist in the openbmc-test-automation repo?

The openbmc-test-automation handles this scenario by extracting the 
MANIFEST file out of the code update tarball before the upload and 
reading the VERSION string, then comparing that with the VERSION in the 
/etc/os-release file in the BMC to determine if the version is already 
running in the BMC.

I wouldn't recommend trying to generate the id from within the test case 
because the algorithm may change. So hopefully checking the version 
string is an alternative that'd work.
