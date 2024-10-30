Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CED9B6D18
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2024 20:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdyQK0Jr5z3byl
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 06:50:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730317798;
	cv=none; b=NS4USuARpJxBCXA2pyIloPT1wDCy/2CYnDwlBRKrS84FektezSELvvhmzucRrl/ibA7h7DwQ/uJW+owsDsFxY4EAIBNKIkyvM1EX3ldU7j87mPGQOhVmvzIeWXus5ylRO3C4F/3TGMjYYzKt7uYJ94wWu7yQFFYRUWYhreXgbiY6QLlVsnjyfYQhzKU88npPYU4MLSTP7JrhRYU38eA81d+8JkMGxe04mMPfh+btaYYgyTY8uW33Y9gItZS4XRGpiXo8VYOaZT99qtXDEYyBsEG/pv4sk6I230EXAA1RFMMLb1J+qHmi4p+lu3TrAEuLYFjVsifPucmPAjZ/GTXKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730317798; c=relaxed/relaxed;
	bh=DGBcWojny3oqio6qspmrzfSrn4k1BT2SJKYi1qzwpoM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CPL6wrvC2xAECNAdjuxT9+3Gfr4wD2McQZYoIQBAYagG00MsZgqmV56XhdGT9Su5hihV9IXXnCanhKttDIFUiDYObt9uPAufLJYjYEADTRq8zRzpiO5awPwgNh1WWOs+gs6qXWTNT+ypY+8TeY7H6WEvxC+SEWze7b411RTZHAVHJc5hccCgRD0gN0447ZQ4yLNiK3WJX7lOsCejTWJaXvSNO1BGuoybRuUWMf9ZGKfvK8mmSdf8DIG8Mg6oo+siWGM9lnwUn9lVOry6753snSCmhlS1J/0dHVuTUuW5C6HTOHw+YJORb+j9CVUIvPz4IRBydNkBeltk+dBl0GwzFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=caW+53Tn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=caW+53Tn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdyQD6Dqnz2xH9
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 06:49:56 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UHTj9F014336;
	Wed, 30 Oct 2024 19:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DGBcWo
	jny3oqio6qspmrzfSrn4k1BT2SJKYi1qzwpoM=; b=caW+53TnylQzniJXnsiogb
	c+77HOL2WsYhDrHxAMPOa5Fo6116a+k2U2Q6JgHsAcBn+aiJvdyrbmTsuGfjnX8G
	spwPabHNdEsfNW9M7Jd12lj5/S1QNMaF1YmyPOKGuMRnMjHrkB/beShVlAOwIp5A
	M5vbO5HeF/6seGcxWq8IuvfqoiLA4MrvBoCVx0duyACdOa504CeHp/RAgrlI+TXV
	tk1KUT6862t1rJi5fZooo9f61PGiC9/a2UipzNnAlPRb8QBxEgxk/ss/zmMA6z0i
	K0e6N4qEsG/U4Bi852ppOHmJgD1LTijMea/ktb9AwbFTXFf/WnF1k6+MjsLyegxA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j43g96fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 19:49:42 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49UJZlwR018803;
	Wed, 30 Oct 2024 19:49:41 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42hc8k9jqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 19:49:41 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49UJne3g42271126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 19:49:40 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EE1658058;
	Wed, 30 Oct 2024 19:49:40 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36AE658057;
	Wed, 30 Oct 2024 19:49:40 +0000 (GMT)
Received: from [9.10.217.132] (unknown [9.10.217.132])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 19:49:40 +0000 (GMT)
Message-ID: <65dabe76-d28f-47db-97c6-0a5ce49b103a@linux.ibm.com>
Date: Wed, 30 Oct 2024 14:49:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: mapper: should it add "default interfaces" and is it valid to
 implement no interfaces on an object?
To: Patrick Williams <patrick@stwcx.xyz>, Lei Yu <yulei.sh@bytedance.com>
References: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
 <ZyJ_s_neyNkWAC2m@heinlein.vulture-banana.ts.net>
Content-Language: en-US
From: Matt Spinler <mspinler@linux.ibm.com>
In-Reply-To: <ZyJ_s_neyNkWAC2m@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _6WZgQKkxCfL0RJjL55_-PyfH7QyETk8
X-Proofpoint-ORIG-GUID: _6WZgQKkxCfL0RJjL55_-PyfH7QyETk8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=911 clxscore=1011
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300153
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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


On 10/30/2024 1:49 PM, Patrick Williams wrote:
> On Wed, Oct 30, 2024 at 03:00:01PM +0800, Lei Yu wrote:
>> ```
>> # busctl -j call xyz.openbmc_project.ObjectMapper
>> /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
>> GetObject sas /xyz/openbmc_project/software/c172a378 0
>> {
>>          "type" : "a{sas}",
>>          "data" : [
>>                  {
>>                          "xyz.openbmc_project.ObjectMapper" : [
>>                                  "org.freedesktop.DBus.Introspectable",
>>                                  "org.freedesktop.DBus.Peer",
>>                                  "org.freedesktop.DBus.Properties"
>>                          ],
>>                          "xyz.openbmc_project.Software.BMC.Updater" : [
>>                                  "org.freedesktop.DBus.Introspectable",
>>                                  "org.freedesktop.DBus.Peer",
>>                                  "org.freedesktop.DBus.Properties",
>>                                  "xyz.openbmc_project.Association.Definitions",
>>                                  ...
>>                          ]
>>                  }
>>          ]
>> }
>> ```
>>
>> If we introduce the change in
>> https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/74832, the
>> above command will get this result:
>> ```
>> # busctl -j call xyz.openbmc_project.ObjectMapper
>> /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
>> GetObject sas /xyz/openbmc_project/software/c172a378 0
>> {
>>          "type" : "a{sas}",
>>          "data" : [
>>                  {
>>                          "xyz.openbmc_project.ObjectMapper" : [],
>>                          "xyz.openbmc_project.Software.BMC.Updater" : [
>>                                  "org.freedesktop.DBus.Introspectable",
>>                                  "org.freedesktop.DBus.Peer",
>>                                  "org.freedesktop.DBus.Properties",
>>                                  "xyz.openbmc_project.Association.Definitions",
>>                                  ...
>>                          ]
>>                  }
>>          ]
>> }
>> ```
>>
>> Note that it indicates that `xyz.openbmc_project.ObjectMapper` service
>> implements **NO** interface on the object.
> This is very strange.  I don't know why mapper would be creating
> these interfaces on objects that don't exist.  It would be reasonable to
> create these on the association objects, since those are actually being
> created by mapper.

Looks like  every D-Bus service works the same way - if the path only 
has the 3 interfaces,
then the GetAll properties method doesn't work:

```
# busctl introspect xyz.openbmc_project.Software.BMC.Updater 
/xyz/openbmc_project
NAME                                TYPE      SIGNATURE RESULT/VALUE FLAGS
org.freedesktop.DBus.Introspectable interface -         - -
.Introspect                         method    -         s -
org.freedesktop.DBus.Peer           interface -         - -
.GetMachineId                       method    -         s -
.Ping                               method    -         - -
org.freedesktop.DBus.Properties     interface -         - -
.Get                                method    ss        v -
.GetAll                             method    s         a{sv} -
.Set                                method    ssv       - -
.PropertiesChanged                  signal    sa{sv}as  - -


# busctl call xyz.openbmc_project.Software.BMC.Updater
  /xyz/openbmc_project org.freedesktop.DBus.Properties
GetAll s org.freedesktop.DBus.Properties

Call failed: Unknown object '/xyz/openbmc_project'.

```


>
> Why is mapper creating interfaces anywhere except where the association
> itself lives?  I don't think deleting the "DefaultInterfaces" is
> necessarily appropriate because those interfaces _should_ be created on
> the association leaf, but elsewhere in the hierarchy they don't belong.
>
> On my system if I introspect the `/xyz/openbmc_project/software/XXXX` in
> mapper, I see only the 3 `org.freedesktop.DBus` interfaces.  If I
> introspect the `/xyz/openbmc_project/software/XXXX/software_version` I
> see those 3 plus an `xyz.openbmc_project.Assocation` interface.  Only
> the `.../software_version` one should have the `org.freedesktop.DBus`
> interfaces.
>
> What I don't know is if this code you've changed is where those
> interfaces are created (probably not).  So your change might not be
> appropriate for solving the underlying issue, which is that we have
> interfaces that don't belong being created on dbus independent from the
> mapper response.
>

