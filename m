Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2731634A7
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 22:19:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MYdP1SZpzDqS1
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 08:19:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MYZK1f5nzDqV7;
 Wed, 19 Feb 2020 08:16:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ILE6da115990; Tue, 18 Feb 2020 16:16:37 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8hwnmt5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 16:16:37 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01ILGAdE153415;
 Tue, 18 Feb 2020 16:16:37 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8hwnmt49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 16:16:37 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01ILDbrF031335;
 Tue, 18 Feb 2020 21:16:35 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2y6896mrpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 21:16:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01ILGYCe46858698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 21:16:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3750678064;
 Tue, 18 Feb 2020 21:16:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB55F78060;
 Tue, 18 Feb 2020 21:16:33 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 21:16:33 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 18 Feb 2020 15:16:33 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: Question for phosphor bmc code - BMC update
In-Reply-To: <CAARXrtmGnAj36LgsW=NHBX0GS6FN9gt_g=UKh2n-v-xe1hhq2g@mail.gmail.com>
References: <HK0PR02MB3427B226A660C70F479B427EEF160@HK0PR02MB3427.apcprd02.prod.outlook.com>
 <CAARXrtmGnAj36LgsW=NHBX0GS6FN9gt_g=UKh2n-v-xe1hhq2g@mail.gmail.com>
Message-ID: <13533f32d91ba1084488b87c0e7da8d9@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_07:2020-02-18,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180139
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Eli Huang/WYHQ/Wiwynn <Eli_Huang@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-02-17 23:24, Lei YU wrote:
> + Adriana
> 
> AFAIK the restriction is added by Adriana, she should know the details.
> I think it's reasonable in production that if the revision is the same
> there is no need to do the code update if the running code is already
> the same version.
> But it does cause trouble in lab debug that one does want to update
> the code with the same revision.

Yeah, that's part of the reason, no need to rewrite the same version if 
it's already running. Also for systems that support dual versions, 
there's not currently a way to represent that both 'sides' have the same 
version via D-Bus objects, since the version id would be the same, so if 
side A is running version X and backup side B is running version Y, if 
side B is allowed to be updated to version X, there would only be one 
D-Bus object.

Is being able to overwrite the same version something that people would 
want? Maybe based on a lab vs production setting?
For configurations that support multiple versions, we'll looking to add 
the ability to have more than one 'side' have the same version.

> 
> On Mon, Feb 17, 2020 at 6:23 PM Eli Huang/WYHQ/Wiwynn
> <Eli_Huang@wiwynn.com> wrote:
>> 
>> Hi Lei Yu,
>> 
>> Confirm a question with you.
>> 
>> When we do the BMC update using phosphor-bmc-code-mgmt,
>> 
>> The code in the image_manager.cpp will get the version in the manifest 
>> file.
>> 
>> If the version is same as path on d-bus, the BMC will not update and 
>> print message “Software Object with the same version already 
>> exists”.
>> 
>> We want to know why upstream code can’t update the same version 
>> image if the BMC are valid.
>> 
>> (phosphor-bmc-code-mgmt commit number : 
>> a013560f96a9ee5c2db4e1778c7dcee199c3acf1)
>> 
>> Regards,
>> 
>> Eli
>> 
>> 
