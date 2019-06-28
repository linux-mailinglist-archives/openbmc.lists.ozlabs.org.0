Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E25A586
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 21:58:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b6y72NLRzDqxb
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 05:58:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b6wX4zzBzDqww;
 Sat, 29 Jun 2019 05:56:42 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SJtncc025170; Fri, 28 Jun 2019 15:56:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tdrq3hhww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 15:56:39 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5SJudcl027644;
 Fri, 28 Jun 2019 15:56:39 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tdrq3hht3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 15:56:38 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5SJsiEI004561;
 Fri, 28 Jun 2019 19:56:28 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2t9by7qhnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 19:56:28 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5SJuRUV59441598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 19:56:27 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 740336E04E;
 Fri, 28 Jun 2019 19:56:27 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47B8E6E04C;
 Fri, 28 Jun 2019 19:56:27 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 19:56:27 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 Jun 2019 14:58:27 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Patrick Venture <venture@google.com>
Subject: Re: phosphor-ipmi-flash: Next Iteration of Control
In-Reply-To: <CAO=notwFhvnF8PEJRAa06PaFc_6Ge4U=Q2eKzdSk26bjatRdfw@mail.gmail.com>
References: <CAO=notwFhvnF8PEJRAa06PaFc_6Ge4U=Q2eKzdSk26bjatRdfw@mail.gmail.com>
Message-ID: <87653f09ac5f171ad42bb118e64ba058@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280226
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-06-28 13:37, Patrick Venture wrote:
> I was thinking, since I'm going to extend phosphor-ipmi-flash to
> support updating a BIOS -- it might make sense to make it more general
> further.  I was thinking about how right now, there are default
> services you can implement for each thing, prepare, verify, update,
> and currently we don't install them (although I was going to implement
> a default prepare service).
> 
> I was thinking that possibly adoption would be easier if they were
> targets instead of service files directly and then we'd always install
> the targets:
> 
> - phosphor-ipmi-flash-prepare-update.target (always called when
> starting up a process each time a new process is started)
> - phosphor-ipmi-flash-verify-bmc.target
> - phosphor-ipmi-flash-update-bmc.target
> 
> Then a user can just install their services into the targets and not
> have to really worry about doing anything more.  I think it's equally
> as usable as before, but ... I don't know.  This way, it always
> installs the targets.

Yeah I think it'd make it more obvious to have the targets installed 
than
having optional services. Also this could allow services to be started
in parallel, like verifying 2 different images at the same time 
triggered
by the target (just thinking out loud).

> 
> I was thinking about this further and was thinking about how
> everything is compiled into the application, dynamically/configurable,
> but compiled in.
> 
> If it's going to start supporting BIOS, and then later other firmware,
> perhaps the list of Blobs and their associated actions should be
> configured via json.  There is a limitation to this though that if
> that's the case, then the ActionInterface used for different things
> would really just become a SystemdActionInterface and we'd use
> services to control everything.  In theory, the json could specify the
> ActionInterfaceType from a list and the parameters after that point
> would be per type..., but I think that's getting a bit easy-to-break.

Yeah, maybe we wait to see if anybody would prefer not having to compile 
the
tool with the available options.

> 
> Those are just some thoughts I had today.
> 
> Regards,
> Patrick
