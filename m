Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAD122B0DE
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 15:59:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCDV64zLtzDrJn
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 23:59:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCDQ03XpYzDrHq
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 23:55:58 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NDVjgk103986
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 09:55:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32facsadej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 09:55:54 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06NDnQVW158509
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 09:55:54 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32facsade5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 09:55:54 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NDpBYS027559;
 Thu, 23 Jul 2020 13:55:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 32brq9mqjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 13:55:53 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NDtrNt65995202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 13:55:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05FAE6A04D;
 Thu, 23 Jul 2020 13:55:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F6B6A047;
 Thu, 23 Jul 2020 13:55:52 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.172.74])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 13:55:52 +0000 (GMT)
Subject: Re: Query regarding using the Redfish in OpenBMC
To: khader basha shaik <shaikkhaderbasha601@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "openbmcbump-github@yahoo.com" <openbmcbump-github@yahoo.com>
References: <CAD+gp9A-mBeKrFTZdVuQ6uz3snDAv2zF-db_=edR=4pOtFcUuQ@mail.gmail.com>
 <CAD+gp9CSsZyhrzG+B+EqB+koBvUSpwB4s56RqrtRD3UHmQfu3w@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <fb32bf4e-d6d8-15a2-14d8-3d3be3be3276@linux.ibm.com>
Date: Thu, 23 Jul 2020 08:55:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAD+gp9CSsZyhrzG+B+EqB+koBvUSpwB4s56RqrtRD3UHmQfu3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_05:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230098
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

On 7/23/20 5:48 AM, khader basha shaik wrote:
> Hi Team,
>
> I am newbiee to  Openbmc.  I want to view  the redfish/v1 
> (https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser 
> .Could you please guide me on what changes i need to so that i view 
> the /redfish/v1/ content in the browser .
>
> here are the steps i have followed:
>
>  1. Clone OpenBMC project : git clone
>     https://github.com/openbmc/openbmc.git in the server machine .
>  2. Compile using the following command:
>     TEMPLATECONF=meta-phosphor/conf  . openbmc-env
>  3. modify the following files:
>
>   *  #build vi conf/local.conf  (modify the  line "-MACHINE??=qemuarm"
>     " to "-MACHINE??=raspberrypi3-64" "
>   * #build vi conf/bblayer.conf (add the following line
>     "/home/khader<username>/openbmc/meta-raspberrypi \"  to the line 
>     above /home/khader<username>/openbmc/metaphosphor \"
>
>        4. #build  bitbake obmc-phosphor-image
>
> The above steps I have used to build an Openbmc project.
>
>
> Can you help me what further steps should i need to do so that i can 
> view the /redfish/v1/  content in the webbrowser.

What BMC system will you use to upload, boot, and run the BMC firmware 
image?  A QEMU virtual system?
Have you seen the developer docs here? 
https://github.com/openbmc/docs/tree/master/development

Good luck,
- Joseph

>
> Note:- I am compiling the openbmc code in the server machine.
>
> Any help /guidelines on this will really help me alot.
> Appreciate all your help.
>
> Thanks & Regards,
> khader B Shaik

