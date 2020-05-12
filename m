Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2B1CFD0E
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 20:18:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49M5fJ0VZmzDqjY
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 04:18:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49M5db06F2zDqgq
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 04:18:09 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CIAUI5137814
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 14:18:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30xa4jjvs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 14:18:06 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04CIAbpJ138029
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 14:18:06 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30xa4jjvrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 14:18:06 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04CIFtiI025944;
 Tue, 12 May 2020 18:18:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3100ubr1uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 18:18:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04CII4VM13632168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 May 2020 18:18:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B592112061;
 Tue, 12 May 2020 18:18:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA799112062;
 Tue, 12 May 2020 18:18:03 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 12 May 2020 18:18:03 +0000 (GMT)
Subject: Re: SELinux UseCases
To: Manojkiran Eda <manojeda@in.ibm.com>, openbmc@lists.ozlabs.org,
 rnouse@google.com
References: <OFBBFB47E3.6EABAE1E-ON0025855A.00486BC9-0025855A.004946E0@LocalDomain>
 <OFC15F6E2A.E823991E-ON00258565.0018CF1F-00258565.00191B17@notes.na.collabserv.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e229e29c-e6a0-ae91-aa5c-2b13a4416faa@linux.ibm.com>
Date: Tue, 12 May 2020 13:18:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <OFC15F6E2A.E823991E-ON00258565.0018CF1F-00258565.00191B17@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_06:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005120136
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
Cc: ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/10/20 11:34 PM, Manojkiran Eda wrote:
> Hi All,
> This is a just a ping - to generate a discussion on the below 
> mentioned use-cases.
> Appreciate any inputs/comments.

Thanks for putting this together.

I would like to see SELinux limit who can write to files under the /etc 
directory.  For example, bmcweb implements REST APIs add and modify 
local users, control pam_tally2 account lockout parameters, etc.  More 
specifically, the phosphor-user-manager daemon modifies files like 
/etc/shadow and /etc/pam.d/common_auth.  Only this application should be 
able to write to these file.  Also, this daemon should not be to allowed 
to write to any other config files.

- Joseph

> Thanks,
> Manoj
>
>     ----- Original message -----
>     From: Manojkiran Eda/India/IBM
>     To: openbmc@lists.ozlabs.org, rnouse@google.com
>     Cc: ratagupt@linux.vnet.ibm.com
>     Subject: SELinux UseCases
>     Date: Thu, Apr 30, 2020 6:50 PM
>     Hi All,
>     (My apologies for the lengthy email.)
>     Below are few use-cases in BMC, which i feel inclusion of SELinux
>     would be a value add (there could be may more missing). Please
>     feel free to drop-in your comments/feedback.
>
...snip...

