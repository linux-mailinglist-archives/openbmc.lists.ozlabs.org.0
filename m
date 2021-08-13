Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E350B3EB9BC
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 18:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmT1w4XRMz3cQK
	for <lists+openbmc@lfdr.de>; Sat, 14 Aug 2021 02:06:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RuzDmuiA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RuzDmuiA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmT1P2p2gz2xnf
 for <openbmc@lists.ozlabs.org>; Sat, 14 Aug 2021 02:05:44 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17DG34VV174735; Fri, 13 Aug 2021 12:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wOkIQ2hbCrqCvKZQEkypbiAbCuV18tfBU7K9TH00Wlk=;
 b=RuzDmuiA90p2fYLBkam5KnkIB10+DyeDJQwFelGwBAV0JubEGgyF7yDo8YhuDiYammGz
 wgICMI6rG7FOUJmsxPNUD/NNynSL7bIu8DVZQ/u6Wp0Umb6RipP5OIiIsKpSmeWN1aeO
 OwYVqZLeu/lRIVud7sFoTabjHF5LGrFz+gTV4oso7JZvfUnJX/f4TDJZPuoUcJEOIOFv
 OCGR/tu1k6HcDX0vcceQu2VtU/3/dYXMRZXI0biWpjUGllhVTxrIGY6SQ+jUpErdwRlJ
 Anvn3QeDYXvIMkVmwxGlQHrSKmrJfcYg+sXHppQ1ofIuPbLI1wvQnVCIEeBBeaxEUDC4 pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3adsvb3ras-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 12:05:40 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17DG423v183173;
 Fri, 13 Aug 2021 12:05:40 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3adsvb3raf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 12:05:40 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17DFqCAJ010254;
 Fri, 13 Aug 2021 16:05:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3a9hthjwyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 16:05:39 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17DG5ctb52363720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 16:05:38 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13FD3C605D;
 Fri, 13 Aug 2021 16:05:38 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD386C6069;
 Fri, 13 Aug 2021 16:05:37 +0000 (GMT)
Received: from [9.211.120.235] (unknown [9.211.120.235])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Aug 2021 16:05:37 +0000 (GMT)
Subject: Re: Turning off the D-Bus REST API by default
To: Ed Tanous <ed@tanous.net>, "i.kononenko" <i.kononenko@yadro.com>,
 Derick Montague <Derick.Montague@ibm.com>
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
 <95593cd9-a394-1388-d227-f54f05c6b2ba@yadro.com>
 <CACWQX81EWvBY=g+weGJHbxA2NWzujeHrHFBA9Cbv0=0OMGya1g@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <e554b486-58e8-94aa-41c2-9fefb9aff339@linux.vnet.ibm.com>
Date: Fri, 13 Aug 2021 10:05:36 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CACWQX81EWvBY=g+weGJHbxA2NWzujeHrHFBA9Cbv0=0OMGya1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C88bi7t-XlfZHqzi99ahK_0yoFgfklUK
X-Proofpoint-GUID: WS6n-iAKHcZ6RYlFrlGocQ-QghrIXzk7
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-13_06:2021-08-13,
 2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130093
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
Cc: Ali Ahmed <ama213000@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/12/2021 2:41 PM, Ed Tanous wrote:
> On Thu, Aug 12, 2021 at 1:32 PM i.kononenko <i.kononenko@yadro.com> wrote:
>>
>> Ali,
>>
>> On 12.08.2021 17:10, Ali Ahmed wrote:
>>
>>> After this commit to use phosphor-webui or D-Bus REST, you will need
>>> to set -Drest=enabled in your bbappend. Note: webui-vue uses Redfish
>>> and will not be impacted. Let me know if you have any concerns.
>>
>> As far I knew, the webui-vue uses REST API to retrieve the TPM status.
>> Please, look to the link below [1]
> 
> @gunnar @derick  isn't this against one of the primary design goals of
> webui-vue?  Was it intentionally merged?  It seems like having
> webui-vue rely on dbus-rest just keeps digging the hole deeper on this
> initial thing, which is getting dbus-rest disabled by default.
> 

I think when this was merged 2 years ago, when webui-vue was still very 
very young, the thinking was we will switch to Redfish when TPMenable is 
implemented in Redfish and there was value to having a working page. 
This does go against a core design goal of webui-vue.  I certainly would 
-1 any commit trying to add D-Bus REST API to webui-vue today. I think 
this is just a TODO that hasn't been implemented.
https://github.com/openbmc/webui-vue/blame/6dba4be6125c10210bafa030ac17737d3a9b28b8/src/store/modules/Operations/BootSettingsStore.js#L74

GET TrustedModuleRequiredToBoot is available today. The PATCH is in 
review here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/44044

We will push a commit to switch this to Redfish.
