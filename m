Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B855BCF7
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 03:29:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX6TT17scz3bxp
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 11:29:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmZsMuhy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmZsMuhy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX6Sx6c5Lz3bhf
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 11:29:21 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S1KkPd010673;
	Tue, 28 Jun 2022 01:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=golBOwamYuFmKEPP696Naa6OxZY1u6hF6rvz9oVSUQg=;
 b=ZmZsMuhyri82yFdlrD/lYX7X59KDPdIbi+0gHDi7hqWamvNybv1LjTIalC41dC1S2c4G
 QTkVMzd85Aq26ej6Qwh/o9d/7ZNs1vbFmZOFhydQnie42QN21/emQe9FV+CPjT5EmYeF
 37H8qQSacthkqEZY+uDyPh9b6UW7HASjiK9uYMH/DXdN6esx0dNd1T5iiqUYSAyMMNAb
 EMuy71lHcVP0yXHfdgjoLghpkkdG/t3tws3n73KUSujv4kSByuAUaH6oWIp0boR6JmQo
 GhyECCe3sO5DZ5Jq3rs95X8e+AbsxVHrbe6sm0ZmnVae0Zd7r5FO20YWmMbn1gxLW00i CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyqwag55k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 01:29:17 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25S1L9t5011641;
	Tue, 28 Jun 2022 01:29:17 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyqwag558-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 01:29:17 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25S1L908006253;
	Tue, 28 Jun 2022 01:29:16 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma04wdc.us.ibm.com with ESMTP id 3gwt09hy2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 01:29:16 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25S1TFi315336114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jun 2022 01:29:15 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 667C3C6057;
	Tue, 28 Jun 2022 01:29:15 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE2A7C6055;
	Tue, 28 Jun 2022 01:29:14 +0000 (GMT)
Received: from [9.160.179.107] (unknown [9.160.179.107])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Tue, 28 Jun 2022 01:29:14 +0000 (GMT)
Message-ID: <d6e0b70d-a80e-6596-9fdd-f4ca8f67485d@linux.ibm.com>
Date: Mon, 27 Jun 2022 20:29:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday June 22 - results -
 BMC-attached TPM
Content-Language: en-US
To: Ratan Gupta <ratankgupta31@gmail.com>
References: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
 <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com>
 <YrN6lkOgNMNCoJdM@heinlein.stwcx.org.github.beta.tailscale.net>
 <cd907039-8b9e-51b3-a672-c079f3e49233@linux.ibm.com>
 <YrOUpSSbSjvMkN+m@heinlein.stwcx.org.github.beta.tailscale.net>
 <a136f639-ce78-1958-b1d4-e00e7a81f792@linux.ibm.com>
 <CAMhqiMoNftcFkRifr3E79O0PT0NCVA08Y=MMTJXe69A8j7C7Bw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CAMhqiMoNftcFkRifr3E79O0PT0NCVA08Y=MMTJXe69A8j7C7Bw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DlOwO1I9qeS7vfavQi_Ixfnk12M9bZbg
X-Proofpoint-GUID: wFfPXL-eaYMyGY-pLEKxhlyF1ZoCMV_4
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280003
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

On 6/24/22 4:27 AM, Ratan Gupta wrote:
> Hi Joseph, Did you check 
> the https://redfish.dmtf.org/schemas/ComponentIntegrity.v1_1_0.json? 
> Regards Ratan Gupta On Fri, Jun 24, 2022 at 5:48 AM Joseph Reynolds 
> <jrey@linux.ibm.com> wrote: On 6/22/22 5:16 PM, Patrick Williams wrote:
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
> Hi Joseph,
>
> Did you check the 
> https://redfish.dmtf.org/schemas/ComponentIntegrity.v1_1_0.json?

I was unaware of the ComponentIntegrity schema.  Thanks for your help!  
That answers the question.
I replied to the forum post as well.

-Joseph

>
> Regards
> Ratan Gupta
>
> On Fri, Jun 24, 2022 at 5:48 AM Joseph Reynolds <jrey@linux.ibm.com> 
> wrote:
>
>     On 6/22/22 5:16 PM, Patrick Williams wrote:
>     > On Wed, Jun 22, 2022 at 04:23:41PM -0500, Joseph Reynolds wrote:
>     >> On 6/22/22 3:24 PM, Patrick Williams wrote:
>     >>> On Wed, Jun 22, 2022 at 01:20:48PM -0500, Joseph Reynolds wrote:
>     >>>> On 6/22/22 10:19 AM, Joseph Reynolds wrote:
>     >>>> 3 Measured boot
>     >>>>       Enable network agents (like keylime server, possibly
>     the host
>     >>>>       system) to get measurements from TPM. Note the
>     measurements are
>     >>>>       digitally signed by the TPM to ensure their integrity.
>     >>> Is there any work going on to define some kind of measurement
>     schema in
>     >>> Redfish?  Last I knew this was absent.
>     >> Thanks for the reminder.  I started a thread for this:
>     >> https://redfishforum.com/thread/685/support-bmc-attached-tpm
>     > Sounds good.
>     >
>     > You mentioned there the "TrustedModules" type.  It doesn't seem like
>     > this exposes measurements currently?  Am I misunderstanding? 
>     That seems
>     > pretty important for our use case.
>
>     Thanks.  I've edited/appended the post to clarify that we need to
>     enhance the TrustedModule schema so we can GET the TPM's measurements.
>
>     -Joseph
>

