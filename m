Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD324C2AF
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 17:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXTpZ0ZdnzDr44
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 01:58:46 +1000 (AEST)
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
 header.s=pp1 header.b=niOZ7f9y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXTnN01TMzDr3X
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 01:57:41 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KFaxnS181360; Thu, 20 Aug 2020 11:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=h+QiXZ9HA8Zt5+chBrMjrTgbPPUfUjNWJNm3f1oQR9g=;
 b=niOZ7f9ynb1X10x9aoRIFZN5fFqtO2MsG1v9mBiyt9g2D6+bKJzTcyZ9tt+jfrP+NysG
 SHHxcAiMso3eP2+BBsxMaNDAVt6iwDjswBebSkP1XlQGaq+Zg9JD6W1Y//rDytbHUc7n
 wtCSDGvumSGMICoZN8Vsfb/IJGUewTaQLWnFcuW3ygW/U0/Z3tDPJcgRYaVS0ViekXKg
 JfpmT2E0hR6qvGIEQNyymM0fod4ZGtxtyLd8694aFMeiTZwf1X4HBc/u8UzQ7RCYjp02
 m40AmzQua+KAWEVFj1dvcopDpjd3wj/nMdAIqk/uhRjFRtaiHgj59XHcT8NwAVT+qmyv mA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3317abat1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 11:57:38 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KFuJnj009610;
 Thu, 20 Aug 2020 15:57:37 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3304sd5by1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 15:57:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07KFvVku59572536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 15:57:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21DF7C6059;
 Thu, 20 Aug 2020 15:57:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A799DC6057;
 Thu, 20 Aug 2020 15:57:35 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.154])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 20 Aug 2020 15:57:35 +0000 (GMT)
Subject: Re: GUI Design Workgroup - BMCWeb login change
To: Ed Tanous <ed@tanous.net>
References: <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@notes.na.collabserv.com>
 <6fd33e23-9845-ed74-7784-75a3a1439f1f@linux.ibm.com>
 <CACWQX80KUxiRXtZv2Cd6UZ=0jTDKdg35JQFOfUAeFsss0kcg7Q@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <267b3391-258a-817c-0afa-9966637226cc@linux.ibm.com>
Date: Thu, 20 Aug 2020 10:57:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACWQX80KUxiRXtZv2Cd6UZ=0jTDKdg35JQFOfUAeFsss0kcg7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_03:2020-08-19,
 2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=989 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008200127
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/19/20 6:06 PM, Ed Tanous wrote:
> On Wed, Aug 19, 2020 at 3:43 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>> What is the best way to resolve the issues?  Email?  Video conference?
>> IRC chat?  Or continue with the gerrit review?
> Gerrit or the mailing list, that way it's documented for the next time
> it gets brought up, and we can point to the discussion later.
 > From Derick:

> That is a great question for the community. We are trying to find a way to
> accommodate this WITHOUT having to manage the login page in BMC Web. Maybe
> we can gather a list of people that are interested and set up a Webex 
> discussion. We should probably post the question in IRC also to make the 
> request a bit broader than email.


It seems to me the review [1] has stalled and is not making progress and it feels like resolving the issue will be a difficult discussion.  And it is often easier to have those discussions face-to-face (or at least audio) which convey more information faster.  So I think I am advocating for a video conference.  And then post the minutes of that conference to the email list [2].

- Joseph

[1]: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35457
[2]: Oops, I think I just volunteered for that role.

