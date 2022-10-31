Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7EB613AAD
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 16:50:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1HfG2pJbz3c7B
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 02:49:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sLjh1Vzv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sLjh1Vzv;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Hdd57m3z2xCd
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 02:49:24 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29VEq81d029921;
	Mon, 31 Oct 2022 15:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/kN1NhZdaxdsijhUsXDEVw5oa4MNZjl20TvNEOFPqrU=;
 b=sLjh1VzvTHZXIlw76duYFTlThfpY5sND/uDw2clsOs6DsAg4QcqEspSviHbbjxoOLaDI
 TRaGYHonYT0z+PfDrSsfxWxx+aUbOZUbtiUUjl9NaRcIrM38LECPjCvKc1ZXy2YXrIGS
 ZFmZIyvjYCrsEGGxNe7B+iJHKIWMsGsmWkm6m4pwbIhkSsIg2IrbFOH90b8ek1SqqBHg
 zIZlOZsYVuvQxWw9k9oS1fm54EovZJDhJw4uGOz25wO8gAhVE8HyecqFq9EiWhDj+ELK
 5u+6yqwplDyrqMpsuGe/zmDmn2OjoxIEivti1U6yXtvZ39SvBMuQsZZw6YqXKMqQFCNb NQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjdvbg4jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 15:49:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29VFagpK017004;
	Mon, 31 Oct 2022 15:49:20 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma04dal.us.ibm.com with ESMTP id 3kgut9t0x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 15:49:20 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29VFmpnQ18678662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Oct 2022 15:48:52 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 519155805D;
	Mon, 31 Oct 2022 15:48:51 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB9FF5805A;
	Mon, 31 Oct 2022 15:48:50 +0000 (GMT)
Received: from [9.163.45.183] (unknown [9.163.45.183])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Oct 2022 15:48:50 +0000 (GMT)
Message-ID: <b4b77503-7dbd-cb54-a2ae-2e986b9acf90@linux.vnet.ibm.com>
Date: Mon, 31 Oct 2022 09:48:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Webui-vue: table multisort feature.
To: Nikolay Chegodaev <n.chegodaev@yadro.com>, openbmc@lists.ozlabs.org
References: <c0a6d816-5567-941a-b280-93acde717916@yadro.com>
 <5f705c41-cca5-27db-405f-7a118584da00@linux.vnet.ibm.com>
 <fc94abed-0bc1-ae69-4851-5765a26c3c62@yadro.com>
Content-Language: en-US
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <fc94abed-0bc1-ae69-4851-5765a26c3c62@yadro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s077kkxDtIU8egAmXPQcU2zOIwIanU71
X-Proofpoint-ORIG-GUID: s077kkxDtIU8egAmXPQcU2zOIwIanU71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_17,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 suspectscore=0
 clxscore=1011 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310097
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
Cc: sandeepa.singh@ibm.com, a.nikhil@ibm.com, i.kononenko@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/14/2022 10:34 AM, Nikolay Chegodaev wrote:
> 
>> What tables are you attempting to add multi-sort to?
>    We attempting to multi-sorting on the Sensors page.
>    It seems suitable to sort by units and status the data
>    that was already sorted in the naming order in
>    our current situation.


Would more filters (e.g. filters for status and units) on the sensor 
page be a better solution here?


> 
>> Sandeepa and I looked at this vue-tables-2 and our concern is the single
>> contributor. We are also concerned about what else might break. Could
>> you explain more why multi-sort is so needed?
>    The only possible explanation is that we have a necessity to
>    implement the feature on Sensors page to sort first by the
>    Sensors names, then add the sorting by units and status fields
>    to that results. Some of our critical combinations could easily
>    be found this way.
>    
>    Yes, there is only one contributor on this project.
>    Majority of the projects a checked recently are all maintained by 1-2 persons.
>    It seems, that 1 component projects are too to be supported by a larger teams.
>    
>    
>    The support on vue-tables-2 is pretty decent, quite similar to the one
>    of free Antiviruses community support - though the documentation is not
>    quite detailed on some new features, the author seems to actively support
>    his project and the answers are quite often and detailed as well.
>    That is why I actually choose this component of all others - because of
>    somewhat acceptable support in comparison to other small projects.

If more filters does not work, feel free to push a prototype to Gerrit 
and we can weight the cons and pros of vue-tables-2 vs bootstrap-vue tables.

We still have concerns about the support of vue-tables-2 and want to 
ensure that no current features break.

The GUI work group meeting on Discord (last Wednesday of each month @ 
10:00 AM CT) might be another good place to discuss this.

Thx,
Gunnar
