Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD615AD95B
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 21:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLydk24gjz30Bl
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 05:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lZ5dfRTx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lZ5dfRTx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLydD6XCnz2xG8
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 05:05:04 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285IgORO014173;
	Mon, 5 Sep 2022 19:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hgdsQOtTgoZ0WiEYLcC7TDNgOJyt7uZh5CT7Xrwxurg=;
 b=lZ5dfRTxmGB/Y5CTESLFSWAUjhD2XY6e09RlUxXbUWX9NqRCenVntH3DgZtxFDXRCrP6
 NZhFYno1xWVDVDyHXRA4I8EonvmyzgmGJfBqdfJBLeK3EMJqg6ttHuM33nKP8N0uM8OU
 +pgZOotZwjtdXeCtoQSB4/kAHxnJiOv7ble7zwG2WBKDD9ITGOtiY6yNmCYvTQu8mVOT
 ya/yIhNDRokP5pTyZtoJE2urryDwovGBwI5M4+v7nnTgmy6bPlbU4ZFxwquNJIiiqu1Q
 w+kSWFoY68+Tlu1IVyGVt8FTOoJmoe1uyrd88O6K6qu7sMFhhW0f5bSkbRnX8fEOFR1C IA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdpmargju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 19:04:59 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285IoE6B008636;
	Mon, 5 Sep 2022 19:04:58 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma05wdc.us.ibm.com with ESMTP id 3jbxj9pm2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 19:04:58 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 285J4wGV16843660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 19:04:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01007AE062;
	Mon,  5 Sep 2022 19:04:58 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6FD0AE060;
	Mon,  5 Sep 2022 19:04:57 +0000 (GMT)
Received: from [9.160.52.140] (unknown [9.160.52.140])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Sep 2022 19:04:57 +0000 (GMT)
Message-ID: <4fdfcba0-cbee-a8ea-6d3e-33f2a0ec3349@linux.ibm.com>
Date: Mon, 5 Sep 2022 14:04:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Patrick Williams <patrick@stwcx.xyz>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
 <20220901124153.ofhmyymhcra34akr@cheese>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <20220901124153.ofhmyymhcra34akr@cheese>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l-4N2bplNwVGv2KaIHTj36XLSTIIgvi8
X-Proofpoint-ORIG-GUID: l-4N2bplNwVGv2KaIHTj36XLSTIIgvi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_14,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050093
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/1/22 7:41 AM, Brad Bishop wrote:
> On Thu, Sep 01, 2022 at 06:25:24AM -0500, Patrick Williams wrote:
>
>> written entirely in Python, which makes it very difficult for us to 
>> support
>> on any of the NOR-based systems (all of them except IBM's latest).
>
> Is the suggestion that they rewrite it in C++ and contribute that?  If 
> it is, why would they invest in building a project and community from 
> scratch as opposed to using an existing one just because all the other 
> in-tree servers are hyper-cost optimized?

I read "applicability" into Patrick's question.  My first thought was 
someone asking why IBM is proposing to put complex and space-consuming 
features into the project, and who else needs them?

I recall from the meeting, but didn't put into the minutes, that the 
Keylime project is creating an implementation based on the Rust language.
The OpenBMC project discussed Rust some years ago, as a language which 
adds additional safety guarantees.  But I am aware of no discussion or 
progress since then, and I didn't find any Rust support in the 
OpenEmbedded/bitbake project (but I think it would be welcome).

Joseph
