Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EDC76F048
	for <lists+openbmc@lfdr.de>; Thu,  3 Aug 2023 19:03:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JKMkup5F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGwCZ4Rsdz30FW
	for <lists+openbmc@lfdr.de>; Fri,  4 Aug 2023 03:03:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JKMkup5F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGwBw1DqRz2yGn
	for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2023 03:02:47 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 373H15bU026029
	for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2023 17:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=b1aCSQzVfQLslyE23O0v3DK5QlJRvoup+VagmP5YM7c=;
 b=JKMkup5FOpS2B0Zd3bWe040dAs3e25rcQmgMu7MXfyhJ+govyxG0PREosiBfMXWUHhKL
 SwKjy9JjN97Y9QkT8QSBKK+sODf/WJ4sjpxLlYu4uH0q7a6RiIgKLoBQs16E8hHhfwLp
 tzOFK7Mbk7/iIpUA5sbTx6QzEYXuDgCBdiL60SOMaoww7n1P8u7eINg1Uu3x+iHxp4L/
 PZq/wiGsNX1TxlX97Cl1P6rgvBUEd+nR8FR18BmjMFEwH7QelNlQKcSsRqrZnVu3w5Oy
 RB0/44dig5ZmplGNDQiPFtKyVjZOMd1OcuOZQz7g3sOcRefcAAW8drrJiWYjmKVEuI6Y Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8g8wr1bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2023 17:02:44 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 373H2hPI000801
	for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2023 17:02:43 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8g8wr1bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 17:02:43 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 373F43kf014550;
	Thu, 3 Aug 2023 17:02:43 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5ft1xj4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 17:02:43 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 373H2gre20840924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Aug 2023 17:02:42 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C749758059;
	Thu,  3 Aug 2023 17:02:42 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E16658057;
	Thu,  3 Aug 2023 17:02:42 +0000 (GMT)
Received: from [9.67.61.18] (unknown [9.67.61.18])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  3 Aug 2023 17:02:42 +0000 (GMT)
Message-ID: <dd842255-9ab0-6fc7-7423-c9420f97dc3c@linux.ibm.com>
Date: Thu, 3 Aug 2023 12:02:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: Error handling
Content-Language: en-US
To: chandu chanti <chandutmba@gmail.com>, openbmc@lists.ozlabs.org
References: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ubhsoe7ov5N8WTPQnmv8MuD-Fua7Wy20
X-Proofpoint-GUID: _useW5LfpcMej_HiDSnqQ1khnaNnjjMX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_17,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030148
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

On 7/20/23 2:04 AM, chandu chanti wrote:
> Hi Team, We are planning to handle errors from backend services in bmc 
> web. We are considering the following approaches to implement it, but 
> we are facing some issues. please provide your inputs. 1 . Using 
> exceptions in our backend D-Bus service
> ZjQcmQRYFpfptBannerStart
> This Message Is From an Untrusted Sender
> You have not previously corresponded with this sender.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJyaRL1Nus7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel83pR4ZZR-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$> 
>
> ZjQcmQRYFpfptBannerEnd
>
> Hi Team,
>
> We are planning to handle errors from backend services in bmc web. We 
> are considering the following approaches to implement it, but we are 
> facing some issues. please provide your inputs.
>

I didn't see anyone else answer this.  Is your question about how to 
architect or design your D-Bus interfaces?  Is the reference the BMCWeb 
merely to provide context as a consumer of these D-Bus services?  I 
assume so.

I don't have any special insights.  Are you looking to follow a design 
pattern?  Are you looking for direction from the BMCWeb maintainers?

Joseph

> 1 . Using exceptions in our backend D-Bus service by throwing 
> exceptions in the D-Bus property get handlers. It works fine for the 
> Get property method call. However, when using the Get All method call, 
> if one property fails, an error is returned without checking the other 
> properties. Is there a way to implement exceptions in GetAll so that 
> even if one property fails, we can still fetch the remaining properties.
>
> 2. Using default values in D-Bus properties to indicate errors. Is 
> there a reference implementation available for setting default values 
> for string and integer data types in bmc web, similar to the 
> implementation of NaN (default value) for the double data type in 
> cable.hpp.
>
> 3. Implement associated return code per property on dbus, but this 
> would be very inefficient in terms of double the properties on dbus, 
> something we would like to avoid
>
> Thanks
> Chandrasekhar T.
>

