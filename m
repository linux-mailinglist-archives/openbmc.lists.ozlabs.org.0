Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8201E2FA197
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 14:31:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKCNL5QnbzDqX3
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 00:30:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jinujoy@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s/5ilrr2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKCKh0KxVzDqM3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 00:28:38 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10IDOTZ7087553; Mon, 18 Jan 2021 08:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pZOMuguoYakkafDlbIHV7STptfJ6vODgoPITkZyPTU4=;
 b=s/5ilrr2d4v1cc3toCPfqaUzEOMdvQ3cZgPNL/3vC2vdgwuiEADL6ZklD4pLuPA8u9RW
 pX5VP4zmYu1Nouy2+vXXPemvLlKxkEPnK7jTZb2NaIjGGf4ISXkie4zI9Dc/Q81ldeta
 ByNop6YqfCJWpy76Q/e8a/h0buiCGQ63rnU3h+OpGDvsVWFlg5Y10Oarb6N62AZyH9fU
 bUV4P2yZpC/RAzdUKeq5EVAONIJSRWgL+5IA73JrHyPamD5Js1UTmrMPUDHUJZtiQe0c
 9WhV6blwCahBJFbpHTNgAZbTy9g+riy7wgRes8EvGHOuwx04wCrK3UlSu7ffvsWLJZYM gA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 365b6hg25b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 08:28:31 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10IDN0OB009505;
 Mon, 18 Jan 2021 13:28:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 363qs892qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 13:28:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10IDSR5x44630406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 13:28:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36CA6AE04D;
 Mon, 18 Jan 2021 13:28:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA4FAE053;
 Mon, 18 Jan 2021 13:28:26 +0000 (GMT)
Received: from Jinus-MacBook-Pro.local (unknown [9.77.194.137])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Jan 2021 13:28:26 +0000 (GMT)
Subject: Re: Control / Operator panel support in systems
From: Jinu Thomas <jinujoy@linux.vnet.ibm.com>
To: bradleyb@fuzziesquirrel.com
References: <8402e577-410a-cf27-9b3e-f2774f086d00@linux.vnet.ibm.com>
 <0745cd96-76d3-2075-4f04-afa4ae560689@linux.vnet.ibm.com>
Message-ID: <76d7d22c-43a6-f144-9e1d-3b499d3a2309@linux.vnet.ibm.com>
Date: Mon, 18 Jan 2021 18:58:25 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0745cd96-76d3-2075-4f04-afa4ae560689@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_11:2021-01-18,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101180075
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Hi Brad,

  Can we get the repo created for the below?

Regards,
Jinu Joy

On 12/01/21 8:17 pm, Jinu Thomas wrote:
> Hi All,
> 
>   I have been working on the design and this is what i have zeroed at.
> 
>  The design aims to accommodate a panel that provides buttons used for navigation and selection of functionality and a display used for visual interaction to the user.
> 
>  The design is divided into two parts.
> 
>   - First part is to have a navigational user select-able section. This would mean the navigation coming from the hardware in terms of buttons. these will be used to perform the required functionality selected by the user.
> 
>   - Second part is to have a display section. The display side will be common for all BMC apps, it will be done via Dbus API hosted by this app. 
> 
> @brad
>  Need a Repository created.
>   
>    I don't think there is any hardware like this out there, so do not see or expect any overlap with the rest of the community, i will be thinking of using ibm_misc or ibm_oem as the repository. 
> 
> Thoughts and suggestions are welcome.
> 
> Regards,
> Jinu Joy
> 
> 
> On 27/08/19 11:06 pm, Jinu Thomas wrote:
>> Hi All,
>>
>>  I was starting to explore on the design for the operator panel seen on IBM systems, it is also called a control panel , which basically is a card unit which has an LCD and some buttons to navigate the display on the LCD. I wanted to check if there is any design or code out there, for such  kind of usage. The design/code can be checked to see if it can be made generic for use, even though the hardware is only used by IBM.
>>
>>
>> Thanks a lot
>>
>> Jinu Joy
>>
