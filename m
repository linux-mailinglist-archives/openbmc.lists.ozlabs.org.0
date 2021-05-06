Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA237547F
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 15:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbYtz2qMtz30Bq
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 23:14:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZGqQ32wG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZGqQ32wG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbYtj5HXLz2yxl
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 23:13:49 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146D3AnF097197; Thu, 6 May 2021 09:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ug/73jSvzemW5aVRXMdgJ+IUC5wMh0pRCR65SRomkVc=;
 b=ZGqQ32wGPrn4jrksrDIVYGKcJFi8uo/IhXO5/MDtTBVJ7L8B0YbOBQWFmKBSCcy5IeKg
 kN8daDGw73NB0FXIV7mA5c6jp6wp33hk45gkIfa+nK8665rEErF+tzGFgYjK+7yHdcl1
 zF6guhio30qLqRqpiEjHrLGJmtH3sSBlT7Yc7entamDdfpV/gboSPDlT6rjoBHMdyAAH
 ggyRX9oGa56qYgunJRLFWNWhWTJhqOO/ue14pbINjvm3RL5KqsFXEYekBt0ta6q8dpRv
 uO3bstGe3eSRUiSBseGSO0kTDjETv4EkaW/C0gAOCSsIrtvvUSqi/p7/z+iVpqanEPMP sQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38cgfphfj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 09:13:47 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 146D7w3S005183;
 Thu, 6 May 2021 13:13:46 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 38bedwkt84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 13:13:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 146DDjAS28115424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 13:13:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF6D0AC059;
 Thu,  6 May 2021 13:13:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 421E0AC05F;
 Thu,  6 May 2021 13:13:45 +0000 (GMT)
Received: from [9.65.118.171] (unknown [9.65.118.171])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 May 2021 13:13:45 +0000 (GMT)
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
To: Andrei Kartashev <a.kartashev@yadro.com>,
 Thu Nguyen OS <thu@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
 <f5eedf23bfea01b5d69b43f4d35970f45f5d4e99.camel@yadro.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <3ab7f192-0830-56cf-583e-7fffd41a50a9@linux.ibm.com>
Date: Thu, 6 May 2021 08:13:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f5eedf23bfea01b5d69b43f4d35970f45f5d4e99.camel@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HGBYL1e4zB7QsNO1gv3jkKycFkbz1F9q
X-Proofpoint-GUID: HGBYL1e4zB7QsNO1gv3jkKycFkbz1F9q
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_08:2021-05-06,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060094
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


On 5/6/21 4:40 AM, Andrei Kartashev wrote:
> Hello,
>
> I guess, when using dbus-sensors, you supposed to use phosphor-pid-
> control package to control fans.
Could you explain this statement further? These apps should be using the same fan sensor dbus interfaces to control fans, so there should be no reason the use of these apps together are required to control fans.
>
> On Thu, 2021-05-06 at 09:22 +0000, Thu Nguyen OS wrote:
>> Hi,
>>  
>> I’m supporting the fan control algorithms using phosphor-fan.
>> Phosphor-fan monitoring and controlling require interface
>> xyz.openbmc_project.Control.FanPwm in the fan inventory object.
>> https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md
>>  
>> But FanSensor daemon of dbus-sensor only adds
>> /xyz/openbmc_project/sensors/fan_tach to inventory list, and this
>> path don’t support xyz.openbmc_project.Control.FanPwm interface.
>>  
>> Do you have any solution to make phosphor-fan work with dbus-sensor?
>>  
>> I’m currently update FanSensor in dbus-sensor to add
>> xyz.openbmc_project.Control.FanPwm to
>> /xyz/openbmc_project/sensors/fan_tach.
>>  
>> Regards.
>> Thu Nguyen.
