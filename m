Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF62CF31D
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 18:29:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnfpN0l9czDrdY
	for <lists+openbmc@lfdr.de>; Sat,  5 Dec 2020 04:29:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TcLlQ2Ix; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnfnM1wBmzDqnc
 for <openbmc@lists.ozlabs.org>; Sat,  5 Dec 2020 04:28:38 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4H3vJu027126; Fri, 4 Dec 2020 12:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DWFXGz7GRsi9eWkNWp0vBQhwvK2yKFChF3wDQ3HeWqE=;
 b=TcLlQ2IxWOTusaYzVoUqjqexd0SvslOajwl/TYrTly+zIq0C/9TvddRtuzztG8Gs7jAx
 PwxPzJlFS2l++Ap3/o4Yi3Jmyl23oFljzn/3KWM7yAYYgsi6Ufpxika24skW1v4aWH78
 0M9b/ar7IzCIEtCnyusgLlIlubyryk1N12aKp3mKGmVP7/3B8ZGnKy/TKIlFfMhPfcT/
 uTPcT9GZM6j0ufOSz9+CEOfpW34U1awi9lw4XPyYAHpOuH9s384EUrhtJI191/1Z6l7k
 GMzf7kC7ekXCFoeC4zXpQ0APyuAm+c3M7DOiwEGPNvkE89MOjazvCEmQ65vGteIMuwJE RA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357ps7d2m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 12:28:35 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4HRbUM025032;
 Fri, 4 Dec 2020 17:28:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3569xuyjp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 17:28:34 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4HSWUo63111638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 17:28:32 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC314BE04F;
 Fri,  4 Dec 2020 17:28:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 432DFBE051;
 Fri,  4 Dec 2020 17:28:32 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.165.167])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Dec 2020 17:28:32 +0000 (GMT)
Subject: Re: LDAP group privilege mapping does not exist
To: Venkata Chandrappa <Venkata_Chandrappa@phoenix.com>,
 Derick Montague <Derick.Montague@ibm.com>
References: <664a67f7de0f4402a9ec217d8c49c7e9@TWN-EXCHMB-13.phoenix.com>
 <OFB52E8381.D86531F6-ON00258633.007D8D31-00258633.007DECA8@notes.na.collabserv.com>
 <30a0cdd8272d469b8207a2d4b41354db@TWN-EXCHMB-13.phoenix.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c5f6484f-9e04-e860-63a4-9eb8ce33d494@linux.ibm.com>
Date: Fri, 4 Dec 2020 11:28:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <30a0cdd8272d469b8207a2d4b41354db@TWN-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_07:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0 mlxlogscore=962
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040096
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/4/20 4:01 AM, Venkata Chandrappa wrote:
> Thanks for the response.
>
> Could you help to share a basic LDAP server LDIF file with an user who is a member of a group with the privileges assigned, somethingthat you've already tested. I've also attached the LDIF file that I've used for my tests. I want to rule out LDAP configuration errors that I may be overlooking before I dwelve into the BMC side investigation.

Good questions.  Thanks for asking and answering!

Have you seen the LDAP tests here?: 
https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/account_service/test_ldap_configuration.robot

When we have a consensus answer, I would like to link to it or summarize 
it here: https://github.com/openbmc/openbmc/wiki/Configuration-guide

- Joseph

> Best Regards,
> Venka
>
> -----Original Message-----
> From: Derick Montague [mailto:Derick.Montague@ibm.com]
> Sent: Friday, December 4, 2020 6:55 AM
> To: Venkata Chandrappa
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: LDAP group privilege mapping does not exist
>
>> Journal logs seem to indicate the mapping doesn’t exist, so I’m wondering if
>> the role groups added in BMC web have been setup correctly.
>     
> I can't speak to that, but we had tested role groups when the view was created
> and we were able to login and perform actions.
>     
>> One more thing to note is when I added the role group, there was a 404 response
>> generated. However, on refreshing the page or navigating back to the page, the role
>> group was added successfully.
>     
> That was fixed in https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/38618. It was
> a UI issue, but the API request was successful as you noticed by refreshing the page.
>

