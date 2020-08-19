Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8C024A9AA
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 00:42:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX2qK30NrzDqyX
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 08:42:53 +1000 (AEST)
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
 header.s=pp1 header.b=cG/LX9Lw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX2pB3TZNzDqxZ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 08:41:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JMVoQF044533
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 18:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wUocwh25LqNbzPNzFlDo9583eXcyO1ncMM6dacKCxuQ=;
 b=cG/LX9Lwcs+UvFZ5GyG0zkrglH2ISaXoif/1VVfaJGMARNvwWyd4LS67/nplb7MjH8b2
 SoAnvJogPnsE3t414vScFCL4hWfIXQkL80MNvewRIZW6bnNUzDs4SHLuMoUyBOyRyW0p
 HlEXbHj/YKKpiFXar3zi7Y2x5l0WhgMY7XXfG4SEIOC9iLUXiQ7qy5hDYmMVzt9AY4iq
 GUg2opqqv3MnxUUkuDtcTyNzC9snrBroDBSC+D6jX+kGI9QsmCMZRmY7+gJ9NDi2OQnH
 LWpz0c9wp5c4fmr3VaTRxEz2ybZbY6NJnZDUXOXQtTF6PLMvknGz64voAK5A0On/s/MO tA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3313ky29k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 18:41:49 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JMYJlP012486
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 22:41:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3304scyd0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 22:41:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JMfi7064553458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 22:41:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E2EC78063;
 Wed, 19 Aug 2020 22:41:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03EDF78060;
 Wed, 19 Aug 2020 22:41:46 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.154])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Aug 2020 22:41:46 +0000 (GMT)
Subject: GUI Design Workgroup - BMCWeb login change
To: Derick Montague <Derick.Montague@ibm.com>, openbmc@lists.ozlabs.org
References: <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@notes.na.collabserv.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <6fd33e23-9845-ed74-7784-75a3a1439f1f@linux.ibm.com>
Date: Wed, 19 Aug 2020 17:41:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_13:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=713 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190178
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

On 8/19/20 8:55 AM, Derick Montague wrote:
>   
> Hello,
>     
> I apologize for the late notice. Here is the agenda for today's GUI Design Work Group.
>     
> - Changes to BMC Web Login and continued work on phosphor-webui

Derick, the "BMCWeb login change" [1] also came up in the security 
working group meeting.  Folks were interested in getting the questions 
answered rather more quickly.

What is the best way to resolve the issues?  Email?  Video conference?  
IRC chat?  Or continue with the gerrit review?

- Joseph

[1]: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35457

> - Use utility classes
> - Discuss Server LED layout -https://github.com/openbmc/webui-vue/issues/18 	
> - Discuss button styles on Local user management page - https://github.com/openbmc/webui-vue/issues/12 	Help wanted items
> - Design Review items
> - Demo of working Web UI progress
>     
>     
> Please visit the wiki for connection info and notes from past groups.
> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>     
>   
> Thank you!
>     
> Derick Montague
> FED Lead | OpenBMC Design Team Lead
> IBM Cognitive Systems User Experience
>

