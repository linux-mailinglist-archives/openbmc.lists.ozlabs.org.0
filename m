Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD2753C0
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 18:20:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vcrk0nBkzDqQV
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 02:20:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vcr04zVZzDqPS
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 02:19:56 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6PFvGLJ095643
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 12:19:53 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tyf561x5q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 12:19:52 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 25 Jul 2019 17:19:50 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 25 Jul 2019 17:19:49 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6PGJmWj44695640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2019 16:19:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 214AA52051;
 Thu, 25 Jul 2019 16:19:48 +0000 (GMT)
Received: from [9.199.48.27] (unknown [9.199.48.27])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 724F15204E;
 Thu, 25 Jul 2019 16:19:47 +0000 (GMT)
Subject: Re: journal log of boot requests?
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=rPEUO80HSivQYY9b0WuaxM_8LwTkPxyySADVxL1A4j+A@mail.gmail.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Thu, 25 Jul 2019 21:49:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=rPEUO80HSivQYY9b0WuaxM_8LwTkPxyySADVxL1A4j+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072516-0012-0000-0000-000003363397
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072516-0013-0000-0000-0000216FCBFC
Message-Id: <e8b521f1-41e4-cd07-df92-7f766b05f9de@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250188
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

+1. Detailed journal logs help in a big way to debug issues.


On Thursday 25 July 2019 09:01 PM, Andrew Geissler wrote:
> I intermittently deal with issues where someone comes to me and says the
> "BMC is randomly rebooting my server". I then get to peel through the journal
> and look for things like this:
>
> Thu Jun 27 10:45:59 2019 witherspoon phosphor-host-state-manager: Host
> State transaction request
> Thu Jun 27 10:45:59 2019 witherspoon netipmid: Transition request
> initiated successfully
>
> And point out to the person that it appears an out of band IPMI command
> actually requested the state change.
>
> Certain paths like a external REST/Redfish commands or I think an inband host
> initiated reboot will only provide the phosphor-host-state-manager entry which
> makes it even more complicated to debug the "who did it" aspect.
>
> You can dig into the details of the journal entry and get the request but
> I think it would be nice to have a little more detail in the journal from the
> server side application that gets the request.
>
> I was thinking of adding a more detailed journal log in ipmi and bmcweb when
> these requests come in. I know we don't want to clog up the journal but state
> changes to the server are a big deal IMHO and should be fairly rare.
>
> Thoughts?
> Andrew
>

