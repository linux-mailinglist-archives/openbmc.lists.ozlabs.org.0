Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E80932B53EA
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 22:43:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZjHD6dhjzDqBN
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 08:43:04 +1100 (AEDT)
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
 header.s=pp1 header.b=i+WVUS4E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZjGN3z6nzDqNs
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 08:42:19 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGLVqoH053157; Mon, 16 Nov 2020 16:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tgxuQ+x8nLmpZ76U4c7ndMpAYWpYc8O++M8QWRnADes=;
 b=i+WVUS4E8joIl1eUo9DxFbnXLqoS/O8u0uaD46b88NHrxPTO7YWiFPAjfaQ714o6fRuS
 ptDOO4i/QCJeQ6cNLc3+VyN1Dw/4cpnfgFVlXw4+PkQObQ5KtWju/E/Xi45WPiaNLoQv
 gJhygXG18BNbc7AkA4bXWuTb0c5pce17KS5BcLsHk0ABF/5amNbVOrnA7d13nLAgwmNY
 xD8KaLp7wQS6vd+Zl1Y6yMubwVrK9F0Y5m/EsZYDhaDYmlKQbhh/sIGaeOi6Hmknc8Ln
 AiYylQ4UzexzGNVdSKeG82JPA3mfP2kpZ8C9fyCanCFPKPwaOytXtFjJT+xrqHQ3ly+v XA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34v0cv1nqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 16:42:16 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AGLSXwN030531;
 Mon, 16 Nov 2020 21:42:15 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 34uttr30nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 21:42:15 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AGLg73r17498408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 21:42:07 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D77E3136060;
 Mon, 16 Nov 2020 21:42:13 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77805136059;
 Mon, 16 Nov 2020 21:42:13 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.139.110])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 16 Nov 2020 21:42:13 +0000 (GMT)
Subject: Re: STEPS FOR CHANGING THE DEFAULT SERIAL CONSOLE TO UART2
To: openbmc@lists.ozlabs.org, Radhika Pradeep <radhika@qwaveinc.in>
References: <CAFMA7evLWM5ER_KAms4may+PanjUeQPH6Wy2JoCjQkiXj84eSQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <7db605b2-2a22-7693-041d-7d85c60cadd3@linux.ibm.com>
Date: Mon, 16 Nov 2020 15:42:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <CAFMA7evLWM5ER_KAms4may+PanjUeQPH6Wy2JoCjQkiXj84eSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_10:2020-11-13,
 2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160125
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

On 11/16/20 2:30 PM, Radhika Pradeep wrote:
> Hi , We have a BMC board based on the AST2520 with UART2 set as serial...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Hi ,
>
> We have a BMC board based on the AST2520 with UART2 set as serial 
> console.We are using the openbmc codebase based on ast2500 with aspeed-g5.
>
> Since the default uart console is set to uart5 we are not able to get 
> the serial console output.
>
> We just got a "mw" command used in uboot to change the register for 
> UART5 TO IO2 routing which can only be done temporarily.
>
> Because we have the console connected to UART2 only. So we need to get 
> the console output at UART2 each time the board boots up.
>
> Could you please provide us with the information on how to change 
> routing permanently or the information about  the file which can be 
> modified to change the register values permanently to get the uart2 
> console output.?
>

Did you see UARTs described here? 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md
Which links to this?  https://github.com/openbmc/obmc-console

- Joseph

>
> Thanks and Regards,
>
> Radhika
>
>

