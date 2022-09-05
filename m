Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD95AD952
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 20:57:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLyS83r9Cz301Y
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 04:57:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XHLV+XG7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XHLV+XG7;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLyRf4lqWz2yZS
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 04:56:45 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285Id86Y032245;
	Mon, 5 Sep 2022 18:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KirG80kNBbJCt6mNQ0iLU4zIrbvf6MXR3BxwyZBzVSc=;
 b=XHLV+XG7weoSmJUj1x4Tj7UX0TcIPlgRNdSESEZQsUzU2U+ZHp+Gan7Y+aj74uyfjRUI
 uotpwsBO715w5x3z6ji/Y1WMX3CFw+PuJxIAGgq3N7QdC7kOlgAcJysXi7bNKUifoIpa
 N7sWnwmIAvq6qVwki3zS28eHA9obXx7X3F10o3QvVObkeDi7UZ9ee4rdyFZ2DG74v1fY
 Vgnf0bcKuJ+ZclzFyryrPExvY6486O7LTyIpDBBBnfmyi9qi/UoS5/TKfcsYcQplOVo1
 Vnu38hypi5tmzutOnGs2gOUoVNfqJOyNSeUw32x0a9T8lcR0ZVETakBPpgWsrxkidtog Dw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdpf80dc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 18:56:41 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285IpNi5002934;
	Mon, 5 Sep 2022 18:56:41 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma01wdc.us.ibm.com with ESMTP id 3jbxj96jcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 18:56:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 285IufeY11862702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 18:56:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 003FCAE060;
	Mon,  5 Sep 2022 18:56:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8490AE05C;
	Mon,  5 Sep 2022 18:56:40 +0000 (GMT)
Received: from [9.160.52.140] (unknown [9.160.52.140])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Sep 2022 18:56:40 +0000 (GMT)
Message-ID: <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com>
Date: Mon, 5 Sep 2022 13:56:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hH-HxC_sUukbEZGallZzMkdEp1yG84OX
X-Proofpoint-GUID: hH-HxC_sUukbEZGallZzMkdEp1yG84OX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_13,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209050090
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

On 9/1/22 6:25 AM, Patrick Williams wrote:
> On Wed, Aug 31, 2022 at 01:09:10PM -0500, Joseph Reynolds wrote:
>
>> DISCUSSION: Create two separate designs for:
>>      Enable Keylime Agent.  Direction is for the keylime agent to open
>>      the BMC network port (using systemd, sort of like how SSH works).
>>      The intention is to engage with Redfish for how to configure the
>>      Keylime Agent: certificates, start/stop the application, etc.
> I guess you said someone is working on a design for this.  The Keylime
> website seems light on details to me, but I'm having trouble
> conceptualizing how it is applicable to the BMC.  It seems more like it
> is geared towards a self-selecting cluster of services (which reject
> peers they don't trust).  Keylime does have the unfortunate aspect of being
> written entirely in Python, which makes it very difficult for us to support
> on any of the NOR-based systems (all of them except IBM's latest).

Yes, an IBM group is working this design.  The design we discussed in 
the security working group meeting has two parts, which I barely 
comprehend.  The parts are:
1. Code running on the BMC will "extend measurements" to a trusted 
platform module (TPM).  Two separate pieces of code are in U-Boot and in 
the Kernel.  The "measurements" are the readonly code image being loaded 
and run.
2. Code running on the BMC (the Keylime "Agent") will query the TPM and 
offer the results to whoever asks.

In my limited comprehension, the end-to-end flow is:
1. The BMC boots up and extends measurements into its TPM.
2. the BMC admin configures the BMC's Keylime Agent.  That is, starts 
the "Keylime Agent service", and provisions certificates, etc.
3. A network agent (a "Keylime Verifier") contacts the BMC's Keylime 
Agent and asks for the measurements.  The Agent that queries the TPM and 
provides the measurements.

Redfish has specs for getting server TPM measurements, but does not have 
any specs for getting BMC TPM measurements.
Because of this, the group doing the work is proposing for the BMC's 
Keylime Agent service to open a separate port, and to not use Redfish to 
get the actual measurements.  In support of this view: there are Keylime 
verifiers already available to use this new port, but there are no 
Keylime verifiers to use Redfish.

It should be clear from the paragraphs above that the intended use case 
is for a client server model, not a network of peers.  The Keylime 
Verifier client running on the BMC's management network contacts the 
Keylime Agent running on the BMC.  The mutual-TLS method is used for 
authentication.

Keylime is written in Python.  I think the the idea was to either port 
that version, or to use the new implementation in Rust.  We did not 
discuss any difficulties in image size increase due to Python or in 
getting the Rust language environment ported to bitbake.

Joseph

> Are we also planning on providing attestation information over Redfish?
>

