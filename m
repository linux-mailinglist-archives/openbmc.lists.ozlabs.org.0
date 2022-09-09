Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6605B3F04
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 20:49:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPQ5l6xslz3bgC
	for <lists+openbmc@lfdr.de>; Sat, 10 Sep 2022 04:49:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tq0k9JRY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gheorghe@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tq0k9JRY;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPQ5F6GLKz30D0
	for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2022 04:49:21 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289Ig370033341;
	Fri, 9 Sep 2022 18:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : reply-to : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YeLmPAuDmgJ4Thqt5BLByxHgrNh56hqGgIMzo6XVgn4=;
 b=tq0k9JRY0SAxK08fD6eSpk2z35mXi1fSbrUMfyj93lnq2oFWh61fMTd6BJqoqjtWSq0K
 uVZgR4TCefbEpO9N0D/8LkvaMtToqtp2l9Jir/d8Hwg1tT8hqi/hlyTmH3UDygoU1mJu
 LEhLlVig4U0Vj4px8zelwBnBZ+XJ8+DA/pKctbc92VL8eURK/Dk8U3ZU2CgNBtaR/fPb
 Y5swTSXdQLwJgOXCIZereCdYJjKNbl/LLnR4RGEV7cR+/euKYvDMXBKre3hR5TiseVCy
 qUhC342W6+aXmug5a7L13kJ2UVqcueAlocFXn2LhuovXNe5xq2hicgTG9dAhE28ASrb1 Iw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jgb0585pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 18:49:17 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289ILes4022120;
	Fri, 9 Sep 2022 18:49:16 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 3jbxjajnu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 18:49:16 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289InF9X10093082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 18:49:16 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0E4FB2064;
	Fri,  9 Sep 2022 18:49:15 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB37FB205F;
	Fri,  9 Sep 2022 18:49:15 +0000 (GMT)
Received: from [9.160.177.223] (unknown [9.160.177.223])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 18:49:15 +0000 (GMT)
Message-ID: <20f2bb8a-ef2f-3ead-ca24-8d70caeebebb@linux.vnet.ibm.com>
Date: Fri, 9 Sep 2022 14:49:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Content-Language: en-US
To: Michael Richardson <mcr@sandelman.ca>, openbmc@lists.ozlabs.org
References: <b9bda737-8e4f-62d3-1000-c42b3326239e@linux.vnet.ibm.com>
 <101586.1662709990@dooku>
From: George Almasi <gheorghe@linux.vnet.ibm.com>
Organization: IBM
In-Reply-To: <101586.1662709990@dooku>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VwUxCRTefuS3W4v918lWnYWSszzAKWtK
X-Proofpoint-ORIG-GUID: VwUxCRTefuS3W4v918lWnYWSszzAKWtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090065
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
Reply-To: gheorghe@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/9/22 3:53 AM, Michael Richardson wrote:
> Thank you for the post.
> I'm interested in understanding how you will do provisioning of the TPM keys.
Hi Michael. I'm going to describe the standard keylime agent 
registration process in a bit more detail -- but not too much, or this 
will be a very long post indeed.

1. EK certificate.

What this is for: The EK certificate on each TPM is verifiable against 
the root CA of the manufacturer, which gives us confidence that the TPM 
is the genuine article and not a counterfeit.

Keylime makes the assumption that the TPM device's EK certificate is 
available on the device. While the
EK certificate can be deleted from the TPM by the end user, devices 
[ought to] ship with it from the TPM manufacturer.

It is possible to use self-signed EK certificates for TPM devices. But 
that weakens the chain of trust provided by keylime, since it involves 
you -- the creator of said certs -- in the process, instead of using the 
likes of Infineon or Nuvoton for the purpose. We think it is *always* 
better to use the manufacturer's key if it is available, rather than 
create our own keys and headaches. Keylime comes with a pre-populated 
list of manufacturer certificates it will accept, and said list includes 
the most widely used manufacturers of TPM devices. FWIW our AST2600 EVBs 
have Nuvoton devices, whereas my Raspberry Pi has an Infineon Optiga :)

2. Public EK (endorsement key)

What this is for: This key defines the identity of the TPM device, and 
is used as such by keylime. It is signed by the EK certificate. To some 
degree of approximation this key pair is "burned into the device" -- not 
literally true, but can be re-generated at will from seeds that *are* 
burned into the device.


The keylime agent usually (re)generates the EK and sends the public part 
(the only part available to anyone outside the device) to the keylime 
registrar, together with the EK certificate. The registrar can then make 
a decision about whether the keylime agent has a genuine TPM device in 
possession, and whether the message coming from network address X and 
hostname Y really corresponds to the correct EK. This guards against say 
spoofing an entire node with keylime.


3. AK (attestation key)

What this is for: the attestation key is the key pair the TPM device 
will use for signing its reports ("quotes") when asked to do so by the 
keylime agent.

The attestation key is established and authenticated cooperatively 
between the TPM device, the keylime agent and the keylime registrar 
using a very careful choreography. The keylime agent must guard against 
someone spoofing the registrar (we use a pre-established server TLS cert 
for this purpose, much like your browser does when it decides to trust 
e.g. ibm.com). The keylime registrar decides whether to trust the 
keylime agent sending it the EK pubkey and certificate as described above.

I will not describe the roundtrip process to establish and activate the 
attestation key.

But *once this roundtrip is complete*, the TPM is "tied" to the keylime 
registrar and will be able to respond to quote requests in a manner that 
is not susceptible to MitM attacks ... which is the goal of the exercise.

That's it. There are additional keys used by keylime for the purpose of 
establishing direct connection between the agent and third parties 
(called "tenants"), but those keys do not involve the TPM device so I'm 
not going to describe them here.


-- George


