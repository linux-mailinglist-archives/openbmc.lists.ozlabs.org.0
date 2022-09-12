Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113115B61C5
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 21:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRGv92YSkz3bZ2
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 05:32:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gW7ExPMy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=gheorghe@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gW7ExPMy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRGtj3fb0z301l
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 05:31:41 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CJQGfR022914
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 reply-to : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jKvbErtjWagDwbvkMO5uV7OUgCIgFhbavC2LK+wCPHg=;
 b=gW7ExPMy+KROSadjGaXOmyo9EswKjE2leE4T/wZBiovEmvkPhQ8sGAkEOe+PipvWb2G+
 BSoSiQZdqjAYFsVEp7jUxXqSHo7k6EZMbo19LyqhOuthNYMKV70AHj+XPI38R6gSwGWA
 1S7OlVrAsqEyFAba3Uxqe+vsAvGQ4tzKHy26LxOspY/F/Y4W6mA3Ch7y345qyzVhetlF
 J6GSTZNdHh5rgGYb4Mi94huhshq7J34y4MfbJB/kGdlZ1lkrsfLhW1DtQ+IUaKBWB8x6
 /dEFtzaLQ4d3viRErJ8aVTbccuVqH+BqXOkgGfJBaHGCV2HLEO4jfS454i1KOZ0m8GGU UA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjax5g5gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:36 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28CJMRLx011028
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:36 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03wdc.us.ibm.com with ESMTP id 3jgj797ece-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:35 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28CJVYUo41681564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:34 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AED8B136059
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:34 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86FC0136051
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:34 +0000 (GMT)
Received: from [9.31.99.5] (unknown [9.31.99.5])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 19:31:34 +0000 (GMT)
Message-ID: <af600c4a-74dd-d4a3-e38c-3c3281395636@linux.vnet.ibm.com>
Date: Mon, 12 Sep 2022 15:31:34 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
 <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com> <32094.1662451519@dooku>
From: George Almasi <gheorghe@linux.vnet.ibm.com>
Organization: IBM
In-Reply-To: <32094.1662451519@dooku>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K1VgKFADie2Shzc1yQHXw3WddlwwvsvS
X-Proofpoint-ORIG-GUID: K1VgKFADie2Shzc1yQHXw3WddlwwvsvS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_12,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120064
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

 > the measurements.
> Yes, but maybe not for anyone that asks.
> The measurement (Evidence) needs to be signed by the TPM (that's part of the protocol).
> There is a freshness requirement, for instance the Verifier can provide a
> nonce through the protocol to be included in the signed Evidence.  Another
> way is to use a TLS Extractor (TLS-Unique in TLS <1.3) to get a key.
>
> You can read more about the architecture at:
>      https://www.ietf.org/archive/id/draft-ietf-rats-architecture-21.html#name-architectural-overview
> (Yes, I'm a lead author)
> I've been really busy on Wednesdays, so I haven't joined lately, but I could
> if you want to talk more about this stuff.

Thank you for the reference document. To the extent I can tell, the 
current keylime verifier implements the picture in Section 3 
(Architectural Overview) fairly accurately, at least up to "attestation 
results". And yes, it does use nonces -- replay attacks are ugly.

Keylime is slightly older than the referenced document, so some of the 
things explicit in the diagram are less than obvious. However, when we 
implemented remote measured boot attestation support for keylime, we 
took care to separate reference values from appraisal policy.

>      > Redfish has specs for getting server TPM measurements, but does not have any
>      > specs for getting BMC TPM measurements.
>      > Because of this, the group doing the work is proposing for the BMC's Keylime
>      > Agent service to open a separate port, and to not use Redfish to get the
>      > actual measurements.  In support of this view: there are Keylime verifiers
>      > already available to use this new port, but there are no Keylime verifiers to
>      > use Redfish.
>
> Sounds accurate, but it seems like doing it through redfish is entirely
> reasonable to me.
That is what we are hoping to get an agreement on. In preliminary 
discussions with the keylime developers, it might be possible to operate 
the keylime agent as a library, built into someone else's REST service 
(e.g. redfish). But *not right away*. So the idea is to get going with 
keylime operating as a standalone basis at least initially.
>      > Keylime is written in Python.  I think the the idea was to either port that
>      > version, or to use the new implementation in Rust.  We did not discuss any
>      > difficulties in image size increase due to Python or in getting the Rust
>      > language environment ported to bitbake.
>
> I imagine that the bitbake recipe is probably the critical path, but I also
> suspect that Rust is being used somewhere with bitbake.
>
We never seriously considered using the keylime Python agent on OpenBMC. 
The requirements in software depdencencies, CPU usage, RAM, _you name 
it_ are horrendous. Rust it is, for a few MBytes of RAM usage (the 
stripped binary is 24MB on my Intel box).

-- George
