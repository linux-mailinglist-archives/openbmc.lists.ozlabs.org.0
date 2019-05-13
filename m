Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2421BB0C
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 18:33:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mbh1pQyzDqCH
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 02:33:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452mZd4mtPzDqG0
 for <openbmc@lists.ozlabs.org>; Tue, 14 May 2019 02:32:57 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DGWEmo047962
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 12:32:55 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfbjfhqkc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 12:32:55 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 13 May 2019 17:32:54 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 May 2019 17:32:50 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4DGWo0D43188588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 May 2019 16:32:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED3B4AC059;
 Mon, 13 May 2019 16:32:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 711B8AC05E;
 Mon, 13 May 2019 16:32:49 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 May 2019 16:32:49 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 13 May 2019 11:32:52 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: How to deal with incorrect firmware image in
 phosphor-bmc-code-mgmt?
In-Reply-To: <CAARXrtkqY+vLUsUmDMiL4o+ZpP4whAtRiqFB5At_PhR7dFD7hQ@mail.gmail.com>
References: <CAN9Jwz1wvT0nhoTb8K9Qf-MTARc3q8kxRQXSH1TCA0e5nJFY4w@mail.gmail.com>
 <CAARXrtkqY+vLUsUmDMiL4o+ZpP4whAtRiqFB5At_PhR7dFD7hQ@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19051316-0064-0000-0000-000003DDB934
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011093; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01202791; UDB=6.00631293; IPR=6.00983707; 
 MB=3.00026868; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-13 16:32:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051316-0065-0000-0000-00003D7480D2
Message-Id: <eb00da838abbb81aff67bb883681e927@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905130113
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
 Troy Lee <leetroy@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-05-08 03:56, Lei YU wrote:
> On Wed, May 8, 2019 at 4:37 PM Troy Lee <leetroy@gmail.com> wrote:
>> 
>> Greeting,
>> 
>> With the method xyz.openbmc_project.Common.TFTP.DownloadViaTFTP,
>> does OpenBMC have a way to know that TFTP download status(completed)
>> and the downloaded image is incorrect?

The challenge is the time that takes to perform the TFTP transfer. A
transfer from a remote server can take minutes to complete, which would
cause timeouts on the REST server. If we can solve this, then we could
return a download status.
See issue for reference : https://github.com/openbmc/openbmc/issues/1691

>> 
>> It would not be a problem if the image is correct, since we'll have an
>> InterfacesAdded signal.
>> But if the image is incorrect (untar failure/signature mismatch),
>> we'll only have an error log entry generated.
> 
> What is the expected behavior if the image is incorrect?
> 
>> Or if the image has the same version id with currently running image,
>> the behavior will become unexpected.
> 
> I met this problem before, and I think we may discuss the expected 
> behavior,
> and fix this case.
> 

The current behavior is that a new Version D-Bus object is not created
because one already exists. If this is unexpected, what should the 
expected
behavior be?

>> 
>> Because we have another service wants to integrate with firmware
>> update service, having a way to confirm the image file is nice to
>> have.
>> 
>> Thanks,
>> Troy Lee
>> --
>> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>

