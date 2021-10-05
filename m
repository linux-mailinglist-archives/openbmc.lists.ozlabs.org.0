Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA2422C6D
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 17:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP1cX6XcPz2yPd
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 02:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zcm7wGG/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zcm7wGG/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP1c31MdMz2yP4
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 02:25:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195EYSnN030680; 
 Tue, 5 Oct 2021 11:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=upxMa0RibbiYnTGVt90RWFO7PXlKdwg4hTcUmNenRL8=;
 b=Zcm7wGG/PeUg9FiUIARTriLYqR8bjDcCNRJTKhwuXuPH8Y3La80EQ7VI6poCMN9nxaOj
 rEHeJt+QTXyD3sn47zrC3/ChI3XMIzQJLmIzA2kPPjJyM5nMkH2K+mtw4IUgiMJgYrrv
 jaLQx8735tIj50x13eVLCJo6o+8fl7EzS25nK1Zlnhqoe6MaLMEOTLrbobwqttjUXyID
 NHqNxdHicGZPxoLhJOQZlcCpnxNNkHud++NhUKUQhI/yYxp19IUxGyJghC5GcMJUMguE
 awGqhBrw9izYP3Vcg9KSEvfDZHoKxWuQC5poqV44ZHsMzJLwk3C+mtBr/IPTkXUp7+/r zQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bgnm9ebre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 11:25:02 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195FI58o018031;
 Tue, 5 Oct 2021 15:25:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3bef2d3x0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 15:25:01 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 195FP0fb39322090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 15:25:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4405B206C;
 Tue,  5 Oct 2021 15:25:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0F8CB2066;
 Tue,  5 Oct 2021 15:25:00 +0000 (GMT)
Received: from demeter.local (unknown [9.65.67.179])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  5 Oct 2021 15:25:00 +0000 (GMT)
Subject: Re: SPAKE, DTLS and passwords + aPAKE and SCRAM
To: Michael Richardson <mcr@sandelman.ca>, openbmc <openbmc@lists.ozlabs.org>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
 <17277.1633384075@localhost>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <a9a07a2a-c093-affa-9d90-bb04d82b9b05@linux.ibm.com>
Date: Tue, 5 Oct 2021 10:24:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <17277.1633384075@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gyjUrBAsGP_nKTCyK4Rf7dgavnDL82Ka
X-Proofpoint-ORIG-GUID: gyjUrBAsGP_nKTCyK4Rf7dgavnDL82Ka
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_02,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=763 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050090
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

On 10/4/21 4:47 PM, Michael Richardson wrote:
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      > The planned IPMI over DLTS function will have certificate-based
>      > authuentication.
>
> Do you mean that the server will be authenticated with a certificate, or that
> it will use mutual authentication?
>
>      > For our use cases, we would like to add password-based
>      > authentication, and we want to do so as securely as possible, meaning what
>      > protocol we should use.  In particular, we want to know if we should avoid
>      > sending a “cleartext” password (tunneled over DTLS) to the server.
>
> If it can be avoided, yes.
>
> https://www.rfc-editor.org/rfc/rfc8125.html#section-3.1 suggests that all
> the PAKE candidates (whether balanced or augmented) satisfy this.
> I strongly suggest that a PAKE be used.
> The CHIP/MATTER IoT people are using
>     https://datatracker.ietf.org/doc/draft-bar-cfrg-spake2plus/
> although the IRTF CFRG hasn't adopted that document yet.  I don't know
> exactly where they are with it.  But, I expect you will find many libraries
> going forward.
>
Michael, thanks for your reply.  I got feedback from my people (but my 
skillset is too weak to interpret it):

Weakness of SRP (Secure Remote Password):
  - Server spoofing, there is nothing that prevents a server from being 
spoofed.
  - Widely adopted with very little proof of being cryptographically 
secure and has been shown vulnerable to pre-computation attacks 
  - No feasible way to check for password complexity in the protocol 
(true for most aPAKE - asymmetric Password Authenticated Key Exchange)
  - Some debate over if actually provides forward secrecy.

Recommendation to look at at OPAQUE aPAKE: 
https://blog.cloudflare.com/opaque-oblivious-passwords/

Suggestion to use SCRAM 
https://en.wikipedia.org/wiki/Salted_Challenge_Response_Authentication_Mechanism

-Joseph

...snip...

>
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>
>
>
>

