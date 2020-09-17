Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6A26E856
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 00:26:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bss5K4xjgzDqgx
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 08:26:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tHdZzOOg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bss4R6CBczDqg7
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 08:25:59 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HM28dw147963; Thu, 17 Sep 2020 18:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MnmVh6svaJGKqdhpOG352P7RZCBNHH8rS7G8i4EMC9A=;
 b=tHdZzOOgDJFrs5da+fhA0b/RFsHyhYLu5mFc4IPkdXadFstrVBlUAEUiWGKTjB6QxHMH
 VxHUYioJJjIwQM70tN2OGmWbiaMITGAYESwM+3aaUCp7BpH4n6c+gd5DOXqw4E7srEFG
 TvsR814Ws1EqscnN4Q3CLm00F0UNkFKceRAurR4boLC/TVXibmrNPE33lqdRaCmMARJ0
 0w4axJjpmOJij3VH3qhUleYcWhlIrilRcDau4T+CapnxHqYPFeK3USUqruDAIe0k6XFD
 jEAl/9z1MaxGlcEXlXAEw7M/9dyyo3nIgl8/Ao0midg4ll0qa3c879E4IfzJclo+tywx 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33mfq8h44j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 18:25:54 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HM3GRC152589;
 Thu, 17 Sep 2020 18:25:53 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33mfq8h44a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 18:25:53 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HMN81I000472;
 Thu, 17 Sep 2020 22:25:53 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 33m7u9va97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 22:25:53 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HMPqLW15008708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 22:25:52 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 664CD124054;
 Thu, 17 Sep 2020 22:25:52 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17D56124052;
 Thu, 17 Sep 2020 22:25:52 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.204.63])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Sep 2020 22:25:51 +0000 (GMT)
Subject: Re: Removing watchdog and ipmi
To: Mike Jones <proclivis@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <BAB0B8A7-DC0E-44EB-93F7-98A2DBEE77C0@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <efe167d3-8bc8-0740-2e6b-dcfadee18a4e@linux.ibm.com>
Date: Thu, 17 Sep 2020 17:25:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BAB0B8A7-DC0E-44EB-93F7-98A2DBEE77C0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_20:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=921 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009170159
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

On 9/16/20 4:55 PM, Mike Jones wrote:
> Hi,
>
> What is the proper way to remove phosphor-watchdog and ipmi from a project?

I'm not an expert, but it seems like you would create a bbappend (maybe 
in the raspberry pi layer?) for 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb
This append would undo the effect of: RDEPENDS_${PN} += 
"virtual/obmc-watchdog"
In this way, the phosphor-ipmi-host package would not pull in the 
watchdog package.

But you probably just need to remove phosphor-ipmi-host and 
phosphor-watchdog (via virtual/obmc-watchdog) will no longer be pulled 
into the image.

To remove phosphor-ipmi-host you would do something like: DEPENDS -= 
"phosphor-ipmi-host".

I hope someone who knows will tell us how to really do it!

- Joseph

> The goal is to not have the watchdog interfere in a raspberrypi project because there is no host, and there is no need for ipmi for my purposes.
>
> I have created host-poweron and host-poweroff services and can manually start/stop them and see my regulators go on/off. I want the webui server power widget to power on/off using these services, but I think the watchdog is interfering. My understanding is obmc-chassis-poweron/off will trigger host-poweron/off.
>
> Based on meta-quanta, I don’t see any other services I have to define to hook up host-poweron/off. This is why I think removing the watchdog is enough. But if there is any other interfering factor in a hostless system, I need to know that as well.
>
> Mike

