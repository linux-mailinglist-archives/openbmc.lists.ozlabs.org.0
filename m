Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DE1E60CA
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 14:28:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xn671dwbzDqVT
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:27:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G76aDe80; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xn2D3tZjzDqVZ
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 22:24:36 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04SCBNmf003736; Thu, 28 May 2020 08:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=q+No7kJENSL/GLtIVS2TO5KH2Wb4u3oPo+a3sT3isrE=;
 b=G76aDe8032Anw2tC2iFooR8jf4jaMwc/csIhW+44AeibqXeLwL6I9NzoQs8EShu4n7sa
 9wp3khu3GtMplVtnlVOxHyeStAyho/lu0A9FAn/WcuHFbbDMnzjIXBGHD5T9OJ0FMxix
 55I8oHYudWJYloEy5WTnEgOzL4UjarGaKZ7XD0pqYW5g2jwHPRiKZQCe+n8t+WpoT5Wk
 uXBeK3WbGil0qTwX3eTc+ujh+F41r8FSMakoEjMLcE4aBxF1u5MgGcT+avO+Bc6rYede
 ST9f5ozowE7hwFQgNXSxxgm4NMjukC8PX1EzceALw7nXyq19T5QqjXvrc+Zxl+cBEQF+ aA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 319qns7k8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 08:24:27 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04SCLUti002761;
 Thu, 28 May 2020 12:24:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 316uf91www-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 12:24:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04SCN8kx47841664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 May 2020 12:23:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A22311C058;
 Thu, 28 May 2020 12:24:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D67E11C04A;
 Thu, 28 May 2020 12:24:20 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.244.94])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 May 2020 12:24:19 +0000 (GMT)
Subject: Re: D-Bus interface to provide data to entity manager
To: Patrick Williams <patrick@stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
Date: Thu, 28 May 2020 17:54:18 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528120331.GC17541@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_03:2020-05-28,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 cotscore=-2147483648
 spamscore=0 priorityscore=1501 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005280080
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 28/05/20 5:33 pm, Patrick Williams wrote:
> On Tue, May 26, 2020 at 06:26:27PM +0530, Deepak Kodihalli wrote:
>> On 19/05/20 9:10 am, Deepak Kodihalli wrote:
>> To do a) above, there are 3 options:
>>
>> 1) Propose a D-Bus interface in phosphor-dbus-interfaces. This was [2]
>> in my original email above. The concern raised by Patrick here is that
>> this interface is very specific to a protocol (PLDM in this case),
>> whereas the phosphor D-Bus interfaces are mostly abstract and protocol
>> agnostic.
>>
>> In my opinion, PLDM is also a data model, so PLDM specific D-Bus
>> interfaces can enable two apps that are PLDM aware (for eg a PLDM
>> requester app talking to the PLDM daemon) to talk to each other. I do
>> see other protocol specific D-Bus interfaces as well (for eg related to
>> SMBIOS). So I don't really understand the concern. The protocol specific
>> interfaces do not preclude other abstract interfaces.
> 
> After thinking about it for a bit, I think this is my preference with
> the design caveat that these are only consumed by processes which are
> "FRU-to-Inventory" transformers.  I would suggest putting these
> interfaces under the 'Inventory/' namespace somewhere to hopefully make
> this clearer.
> 
> We have two implementations of these "FRU-to-Inventory" transformers: EM
> and PIM.  Both of them have a form of dbus backdoor in order to get the
> information they need to create the Inventory objects they host.  PIM uses
> `Inventory/Manager`[1] and EM uses an undocumented `FruDevice` interface
> between it and 'fru-device'.  Both of these implementations do
> processing on the data they get (though, very minimal in the case of
> PIM) and create `Inventory/Item`s as a result.
> 
> What I am worried about, and Richard seconded in his response, is the
> details of PLDM (or any other protocol) starting to leak into other
> processes.  We don't want people to notice that there is some piece of
> information that isn't currently exposed via Inventory but happens to be
> available in PLDM and start coding towards consuming it.  Hence, my
> request that the design document the caveat I listed above.  We want to
> limit the scope of applications that need to understand specific
> protocols.
> 
> My suggestion would be to put these new proposed PLDM interfaces under
> `Inventory/Source/PLDM`.  Anything under `Source` becomes one of these
> "FRU-to-Inventory" transformational interfaces.


Makes sense to me. This makes the intent clearer. I've updated my commit 
on Gerrit. Please re-review.

Thanks,
Deepak

> 1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Inventory/Manager.interface.yaml

