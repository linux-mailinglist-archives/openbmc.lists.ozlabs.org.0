Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A867292CCF
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 19:31:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFP1h51VrzDqfP
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 04:31:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZJp4HhzO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFP0d0m4fzDqX2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 04:30:24 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09JGgOMm141675; Mon, 19 Oct 2020 13:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YdBGSFkvDfnAdC4meMgDCRGLULnhd2+8H2sY5OTNQAQ=;
 b=ZJp4HhzOmtjrY1rroC4rJx7XopTkxxp+03JOOSwCt754Lrg8w41MWdQq6ghxEqRiSgzn
 qNhEqcd6PcvX4qT0FdUWy62jfdGa0Uk61peiuUK5c0/hSS9QCWmVD81PukxuWP445ASd
 Mdl4F+266D2ckg2OpUGDwT/FxqpBFUiDvGND8m/pAXpR5nN5lDdJVnOdexkkH9h4u2Gp
 CmZWv7xkwRQNageHfgbqch7y584tnsCtAKkMEc0OBhBeMegkJ4yefiTN1eHBvmOYwOHY
 Q7bEDGlBBbJR1cim0SZcyLYA9xEcyu5KRvg7HCUNCsFAuIecA968xtl8OKBXCsmZr9uc 4w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349ej5herr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 13:30:20 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09JHRF7h024725;
 Mon, 19 Oct 2020 17:30:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 347r88sjnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 17:30:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09JHUB7S62783954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 17:30:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 806C8BE051;
 Mon, 19 Oct 2020 17:30:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39D69BE04F;
 Mon, 19 Oct 2020 17:30:17 +0000 (GMT)
Received: from [9.206.193.244] (unknown [9.206.193.244])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 17:30:16 +0000 (GMT)
Subject: Re: Redfish CPLD version
To: Leo Cheng <Leo_Cheng@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <5a6195e0729c4cd0a522f41d5b3aa3f1@TWN-EXCHMB-13.phoenix.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <40989450-c868-dfff-54cd-8ceaa5107a13@linux.vnet.ibm.com>
Date: Mon, 19 Oct 2020 12:30:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <5a6195e0729c4cd0a522f41d5b3aa3f1@TWN-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-19_07:2020-10-16,
 2020-10-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190110
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

On 10/16/2020 2:39 AM, Leo Cheng wrote:
> There is BIOS version defined in Redfish.
> 

BIOS version is implemented here in bmcweb: 
https://github.com/openbmc/bmcweb/blob/2deeab547e4e4defc7da9012caa6b44f932e7607/redfish-core/lib/systems.hpp#L558

It looks for the 
xyz.openbmc_project.Software.Version.VersionPurpose.Host interface and 
the functional association to determine "BiosVersion"

> Will you plant to have CPLD version in the future?

I don't see a place in the Redfish spec for the CPLD version, I could 
have missed it though. If it is indeed something that needs added to 
Redfish, new features can be requested at https://redfishforum.com/
