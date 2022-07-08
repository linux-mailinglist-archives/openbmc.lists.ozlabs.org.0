Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541956C141
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 22:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LflGR2m3yz3c6x
	for <lists+openbmc@lfdr.de>; Sat,  9 Jul 2022 06:28:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GLBekMXj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GLBekMXj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LflFx0yNDz305v
	for <openbmc@lists.ozlabs.org>; Sat,  9 Jul 2022 06:27:48 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268IUawp001430;
	Fri, 8 Jul 2022 20:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=X5MRDDq9wVh0qyK8cR8FrtEyRS1XfNeoEIgy4DGBhtI=;
 b=GLBekMXjPMOPUgES7Vfs86ufZL0O24Wy5AL9SUEO4wObZiImFGEVvuO7K1PUQxI4nr0N
 fT9UVN53o+i4iNDPD6xL7nf6S4FZcOdDKIrJNkcl0sRoAijo6SaDB3lVGBdkg0yKOhC3
 K0Z3+PwNNvhl3arY7m4lE4ii9fgwRUdLyPYAnEYVw9ZlNUba++TgBLTPCsHHpLHN4v9w
 jxdY/qf2q9xMJQAOu/7larEHlq3lFpE7fKR+2uzWlmjDP7Z+lgWuU1AIXm8dLYfxTSmF
 /6ob/5GH4LM22hrDj9KgUDtIuoi2iRlUQWjbGxUec6OlxZbiLe1ImbTDZud94GuTzAjq Qg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6q9upkg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Jul 2022 20:27:45 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 268KKLHd022514;
	Fri, 8 Jul 2022 20:27:44 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma03dal.us.ibm.com with ESMTP id 3h4v5vtaxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Jul 2022 20:27:44 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 268KRhTV34537914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Jul 2022 20:27:43 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA3C72805A;
	Fri,  8 Jul 2022 20:27:43 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 846D628059;
	Fri,  8 Jul 2022 20:27:43 +0000 (GMT)
Received: from [9.160.98.68] (unknown [9.160.98.68])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  8 Jul 2022 20:27:43 +0000 (GMT)
Message-ID: <521635ac-e331-8afc-10e6-d20b7933c45d@linux.ibm.com>
Date: Fri, 8 Jul 2022 15:27:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Content-Language: en-US
To: "Maheswara Kurapati (QUIC)" <quic_mkurapat@quicinc.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <MN2PR02MB71041CCCF98E562120942620F7819@MN2PR02MB7104.namprd02.prod.outlook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
In-Reply-To: <MN2PR02MB71041CCCF98E562120942620F7819@MN2PR02MB7104.namprd02.prod.outlook.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2xWT3N0CEq6Kx-DPAFuGkPD48g6aO3RQ
X-Proofpoint-ORIG-GUID: 2xWT3N0CEq6Kx-DPAFuGkPD48g6aO3RQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_17,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080079
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



On 7/5/2022 6:16 PM, Maheswara Kurapati (QUIC) wrote:
> Hi, I want to monitor a fan based on its tach which is controlled by 
> the pwm. Came across the below earlier discussion on this topic which 
> suggested to add two more configuration parameters “target_path”, and 
> an optional “sensor_path”.
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>
> Hi,
>
> I want to monitor a fan based on its tach which is controlled by the 
> pwm.  Came across the below earlier discussion on this topic which 
> suggested to add two more configuration parameters “target_path”, and 
> an optional “sensor_path”.  I did not find this code in the latest 
> phosphor-fan-presence.  Not sure if different tag names are used for 
> this purpose.  Can someone please let me know?
>
> https://lists.ozlabs.org/pipermail/openbmc/2021-May/026253.html
>

No, I never saw anything come through related to this.

> Thank you
>
> Mahesh
>

