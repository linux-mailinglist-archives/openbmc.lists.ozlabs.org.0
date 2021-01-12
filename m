Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F29F2F332F
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 15:49:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFYPY5HVqzDrQh
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 01:49:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jinujoy@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lGvXrVea; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFYN83FwdzDr7H
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 01:48:01 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10CE3sU1028248
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 09:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=HL50WmQfQ6wprDhx50F9n19qWCyXEJD9jZQlDJCFqlY=;
 b=lGvXrVeaX6uU6nHLvRkUBPsIWdRpNyn9pB19ZSqIoH5AxDUFtL6OldtqcE2B3o+Xcp1d
 vAkJWOlvuCYe7XithsZOd2VfRsAys2XqpxK23NUmPdSaPZ28t6JYtkt7r4OyMWYa6NCD
 lshH3bcACiJaw9rYQc7kWsy3g7494KxCughw8+nc17bhmdiDmSUyhLEuUyacFaNe7V0V
 VTx00jFvFgbJyutotFLQmreqAdOn6giOoK6GtuktwT67dg72gSvB6VyoFzBx6D88fXmh
 4QiP9jsrX9rveBqwAO7hJiTQPC4uHtaJEdkF+J9QT55UKIAOTNF+mchqttyQCUldjOzA eg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 361d2g2262-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 09:47:54 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10CEcHNF011315
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 14:47:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 35y4489x29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 14:47:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10CElndt26411504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 14:47:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB0E3A4066
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 14:47:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51CA4A4062
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 14:47:49 +0000 (GMT)
Received: from Jinus-MacBook-Pro.local (unknown [9.79.216.98])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 14:47:49 +0000 (GMT)
Subject: Re: Control / Operator panel support in systems
From: Jinu Thomas <jinujoy@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <8402e577-410a-cf27-9b3e-f2774f086d00@linux.vnet.ibm.com>
Message-ID: <0745cd96-76d3-2075-4f04-afa4ae560689@linux.vnet.ibm.com>
Date: Tue, 12 Jan 2021 20:17:48 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8402e577-410a-cf27-9b3e-f2774f086d00@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_07:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120080
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

Hi All,

  I have been working on the design and this is what i have zeroed at.

 The design aims to accommodate a panel that provides buttons used for navigation and selection of functionality and a display used for visual interaction to the user.

 The design is divided into two parts.

  - First part is to have a navigational user select-able section. This would mean the navigation coming from the hardware in terms of buttons. these will be used to perform the required functionality selected by the user.

  - Second part is to have a display section. The display side will be common for all BMC apps, it will be done via Dbus API hosted by this app. 

@brad
 Need a Repository created.
  
   I don't think there is any hardware like this out there, so do not see or expect any overlap with the rest of the community, i will be thinking of using ibm_misc or ibm_oem as the repository. 

Thoughts and suggestions are welcome.

Regards,
Jinu Joy


On 27/08/19 11:06 pm, Jinu Thomas wrote:
> Hi All,
> 
>  I was starting to explore on the design for the operator panel seen on IBM systems, it is also called a control panel , which basically is a card unit which has an LCD and some buttons to navigate the display on the LCD. I wanted to check if there is any design or code out there, for such  kind of usage. The design/code can be checked to see if it can be made generic for use, even though the hardware is only used by IBM.
> 
> 
> Thanks a lot
> 
> Jinu Joy
> 
