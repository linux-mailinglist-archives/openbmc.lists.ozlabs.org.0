Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4863B758
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 02:42:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLlSn3KCpz3cL0
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 12:42:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayWox5aq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayWox5aq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLlSD1M8Xz3c3G
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 12:41:47 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT0tfn4006872;
	Tue, 29 Nov 2022 01:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=q5D24DuPsbnFvm/i4T4QWsMzyH87pPMKfvUt+41p9V8=;
 b=ayWox5aq7e4iQU2Keed3VAt1MuQ/MXbJ0JwMVs3KVAsMO0JRbgcqC9z2Sat74XgFzpqU
 KpuBlta93XH2V6BEly1fXptBPPhUx6EqpsJkbfeovpM/oydVnPKMNrYTMyxdg5EDamT0
 UX2EE6/tl9c0+uq5mxpqoZ/okujqQrJqSMLdoCMeES1je4p/Ge8ZhvLPCV2r3/4vRuO6
 JsQTE2OP0SvdzDM52ixpTjvAquiMwrUEPhIi0JczZGyhcTKVHGdynjUmNKtv+VV+f+cq
 pjGRdmwth6zbXs/K0L9mK6INlxxdP9fBP+CYaQfdrLdet2vECgWSo4BHqtyqoVVU1e7r aQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m57yg8v3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 01:41:41 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT1a0lv017517;
	Tue, 29 Nov 2022 01:41:41 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma02dal.us.ibm.com with ESMTP id 3m3ae9dg87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 01:41:41 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT1fdET11272918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 01:41:40 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 785AB5804E;
	Tue, 29 Nov 2022 01:41:39 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB8175803F;
	Tue, 29 Nov 2022 01:41:38 +0000 (GMT)
Received: from [9.160.91.87] (unknown [9.160.91.87])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 29 Nov 2022 01:41:38 +0000 (GMT)
Message-ID: <0d89ea81-3f9a-3b59-6b82-5e503596e1a4@linux.ibm.com>
Date: Mon, 28 Nov 2022 19:41:37 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: Potential high risk for readonly/operator users on BMC console
 access
Content-Language: en-US
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Phong Vo <pvo@amperecomputing.com>,
        Phong Vo OS <phong@os.amperecomputing.com>
References: <496697FB-7A80-4F2B-BC4A-8955016082CD@amperemail.onmicrosoft.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <496697FB-7A80-4F2B-BC4A-8955016082CD@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4b_xBDhxywmjq3sfldbwgnTHGuzxV07X
X-Proofpoint-ORIG-GUID: 4b_xBDhxywmjq3sfldbwgnTHGuzxV07X
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_01,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211290009
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
Cc: Nga Nguyen <nga.nguyen@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/21/22 4:17 AM, Thang Nguyen OS wrote:
> Hi,
> I would like to have your comments on below issue which we think it is high risk security issue which description below:
>
> Any user (read-only, operator, administrator), when created, has BMC console access/login by default. He can login to BMC via BMC console and do the following actions:
>   - Write to his /home/<user> folder to full. This will make the RootFS full and no more operation can be done, unless do A/C power and reflash the BMC from u-boot.
> - Write to /tmp folder to full which will make many application fail to work.
> It is good for administrator as he should have full privilege. However, for readonly/operator users, he should not have console access. No matter if he makes the BMC crashed by mistake or it is his intention, we should prevent his happens.
> It is known that many production systems do not support BMC console but still have some support and some companies allow remote access via KVM or console server. I think we should disable shell login for normal users (readonly and operator) by default.

Thanks for your report.  Here are my thoughts.

You are describing resource exhaustion, sometimes denoted as one of:
- CWE-400: Uncontrolled Resource Consumption
- CWE-770: Allocation of Resources Without Limits or Throttling

I agree this will lead to the failure of various BMC functions leading 
to denial of service.

There are two ways to access the BMC command shell:

1. Access to the BMC command shell via SSH port 22.  The default BMC 
configuration only allows Administrator users to have access. [footnote 1]

2. Access to the BMC command shell via the BMC's serial port.  The 
typical BMC setup either does not have a console or specifies that 
access to the BMC's physical console port should be protected.

Please see some related build-time configuration options here: 
https://github.com/openbmc/openbmc/wiki/Configuration-guide#bmc-console-shell-access

Also, we can consider adding a check so that only admin users are 
allowed to access to a BMC command shell via the BMC's serial console.  
(And non-admin user will be logged off.)

- Joseph


Footnote 1:
The effect of the following is to configure the dropbear SSH server so 
only users who are in the priv-admin Linux group are allowed to connect 
via SSH.
This config parameter: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default
Is configured into the image from here: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear_%25.bbappend
and is used on the dropbear command line from here: 
https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-core/dropbear/dropbear/dropbear%40.service




>
> Thanks,
> Thang Q. Nguyen -

