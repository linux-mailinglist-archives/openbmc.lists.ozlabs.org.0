Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6436A57E84D
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 22:32:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LqLhK1hgYz3bwr
	for <lists+openbmc@lfdr.de>; Sat, 23 Jul 2022 06:32:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7U8daY8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7U8daY8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqLgq17wvz2ywJ
	for <openbmc@lists.ozlabs.org>; Sat, 23 Jul 2022 06:31:34 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MKIBHh035145;
	Fri, 22 Jul 2022 20:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=Rk72DN0MdudbXmeoT3pijjGyVoM33jk96ISrlmxrgYo=;
 b=s7U8daY8GzTEwaqSt/Oee/fqNnCdlEAFtNnqiSbTz2FCz0lKZ/Y/HK0NPBYOQ6QxdLO8
 niZ59rQBPHqL2Kxn9sEk4hciNQflAwh5geXn4tzxvirCHvsuJuC6w9wim9SfjntEozVy
 /rKP7eZBaSIdb1vO4CCD/7UiGd1H8//FyzqbD/an/S4vuQrdoihxS+/ThDtOjZL0BS1z
 phWKYilUxrlrkjgXC3bixvESV0QS7/Cj/YNndI/gkKvg168YEg4wZ6KScE5KAhTdfZWG
 uGFGtwC7cud63zLZlXzcikW5/LBlhAl74891dbySC0U+5+dJx2X9rZxUBf0MfBmb1vX0 Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg2tf8an2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jul 2022 20:31:29 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26MKL1g1007281;
	Fri, 22 Jul 2022 20:31:28 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg2tf8amr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jul 2022 20:31:28 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26MKLkP8011124;
	Fri, 22 Jul 2022 20:31:28 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02dal.us.ibm.com with ESMTP id 3hbmyaa296-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jul 2022 20:31:28 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26MKVR8O40567152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Jul 2022 20:31:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA7AB7805E;
	Fri, 22 Jul 2022 20:31:26 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51AAC7805C;
	Fri, 22 Jul 2022 20:31:26 +0000 (GMT)
Received: from [9.65.221.58] (unknown [9.65.221.58])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Fri, 22 Jul 2022 20:31:26 +0000 (GMT)
Message-ID: <fcf6043c-1d69-9681-6dea-629ad4dffade@linux.ibm.com>
Date: Fri, 22 Jul 2022 15:31:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
        Gunnar Mills <gmills@linux.vnet.ibm.com>,
        Krzysztof Grobelny <krzysztof.grobelny@intel.com>,
        nanzhoumails@gmail.com
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: BMCWeb support new HTTP headers Referrer-Policy and Feature-Policy
 renamed to Permissions-Policy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jdTs-m4YKJgFZk9s1Y8KpjrxvhEQskVV
X-Proofpoint-ORIG-GUID: RxinA9Y1dyZk84L5ltXYvK2uDAJEqNWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220082
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

BMCWeb maintainers,

This is a request to add new HTTP headers.  Some of the newer dynamic 
security scanners are looking for the "new" HTTP headers and complain if 
they are not present.  The headers include:
- Referrer-Policy
- Permissions-Policy
- Feature-Policy renamed to Permissions-Policy

Should we support these in BMCWeb?  Maybe as hard-coded response header.
For example, for the Permissions-Policy, would we ever need to 
accelerometer or microphone?
When selecting the Referrer-Policy we should select secure default 
values, and also consider the Web GUI development scenario when the Web 
site is hosted off of the BMC.

I am not an expert on HTTP headers and I do not know what values to 
use.  My purpose is to determine if these headers are useful (I believe 
they are) and update BMCWeb to set some sane values.

Joseph

