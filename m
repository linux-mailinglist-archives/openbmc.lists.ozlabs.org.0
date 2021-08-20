Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526653F316B
	for <lists+openbmc@lfdr.de>; Fri, 20 Aug 2021 18:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grn1F1G8Vz3cPy
	for <lists+openbmc@lfdr.de>; Sat, 21 Aug 2021 02:20:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B9s2oDDr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=B9s2oDDr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grn0l65V8z3bml
 for <openbmc@lists.ozlabs.org>; Sat, 21 Aug 2021 02:20:06 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17KGF5oj095953; Fri, 20 Aug 2021 12:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WJm5yZFLW+jKoKLrry3yAR3sGM0z0w3kkxwE8g5JEzg=;
 b=B9s2oDDr357e8SIonej168nx4+XImEtqdQvBv1CLPNAGaxYVyphevCprlISvYQ4iUQa0
 4jLPEPH8aWd8SP+Z9yDdJ6DemRB9bxqa0Kl4K07p1OfkLszQ0pPnFN0wkalF/WbKK+lo
 C49fvodoy3Z7aaW2tzWEeisZF2wL0feMs2rwf20VcUrkwC7HLRYXt0jbEDXyy9kqqvfG
 9xzFjFyqrQNXNAM/MU5ogTL4JLgPfjIAhxVbuiBhG7EqfcY+ajM53r4cGWKb0ITt7BrI
 ewu6rdZmL8qEKBrD945OB/Ua5L2sQIEHciirC72vOvO5rjm9+SiGWKy+tR/RQeXOIj3z XQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ahq0ws66c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Aug 2021 12:20:01 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17KGIFEe023328;
 Fri, 20 Aug 2021 16:20:00 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3ae5ffyvfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Aug 2021 16:20:00 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17KGK0k239715224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Aug 2021 16:20:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46B1612405B;
 Fri, 20 Aug 2021 16:20:00 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7B25124052;
 Fri, 20 Aug 2021 16:19:59 +0000 (GMT)
Received: from demeter.local (unknown [9.163.36.199])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Aug 2021 16:19:59 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday September 18 - results
 - add idle timeout
To: Jeremy Kerr <jk@ozlabs.org>, openbmc <openbmc@lists.ozlabs.org>
References: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
 <911133cc-791b-5cec-4de9-c2d9f85f7e82@linux.ibm.com>
 <e6ff536d22764e44ac9444c50bad41d4b4a1d8c1.camel@ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <99bf8737-daec-1d75-42a8-3c5c3b08430a@linux.ibm.com>
Date: Fri, 20 Aug 2021 11:19:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <e6ff536d22764e44ac9444c50bad41d4b4a1d8c1.camel@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uJwAt2KaQlAWbITCqHW6V37wDpVCCoRE
X-Proofpoint-ORIG-GUID: uJwAt2KaQlAWbITCqHW6V37wDpVCCoRE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-20_06:2021-08-20,
 2021-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108200091
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

On 8/18/21 7:49 PM, Jeremy Kerr wrote:
> Hi Joseph,
>
>> 5 How to add session timeouts to host console?
>>
>> DISCUSSION:
>>
>> See the diagram in the README under
>> https://github.com/openbmc/obmc-console
>> <https://github.com/openbmc/obmc-console>.
>>
>> We thought obmc-console-client was the right place to implement the
>> timeout mechanism.
> OK, but that diagram doesn't really cover the detail you'd need to base
> such a decision on; there's the ssh server between port 2222 and the
> obmc-console-client program.

Here is my understanding of the code which establishes new connections.  
My knowledge here is limited; please correct me or ad anything I missed.
1. The service to listen at port 2200 ("host console") is here:
github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/console/obmc-console_git.bb
2. That service uses systemd service files under:
github.com/openbmc/obmc-console/tree/master/conf
3. The `obmc-console-ssh@.service` handles each new connection by 
running dropbear which connects the instance to the obmc-console-client 
program.

When a network client reaches TCP port 2200, I understand the flow is:
1. When the obmc-console-ssh.socket gets a new connection, it activates 
an instance of obmc-console-ssh@.service.
2. The obmc-console-ssh instance runs the dropbear program.
3. The dropbear program creates an SSH session which connects the 
network session user to the obmc-console-client program.

Given that flow, I see the following choices for where to enforce an 
idle timeout:
1. Do systemd sockets have a timeout mechanism?  I found controls for 
when the listening socket is idle, but not for a socket handling  
connection instance.  However, my knowledge in this area is very limited.
2. The dropbear SSH server has a session idle timeout mechanism (command 
line parameter: `dropbear ... -I 3600`).
3. Add a new parameter to the obmc-console-client.  See 
https://github.com/openbmc/obmc-console/issues/18
4. Run a new program between dropbear and obmc-console-client to provide 
the idle timeout, for example, like the`screen` command with TMOUT set 
to the desired timeout.

Of these options, I think the easiest is to have dropbear provide the 
timeout, but note that OpenSSH does not provide an idle session 
timeout.  I believe the right solution is to add a timeout to 
obmc-console-client, as proposed in obmc-console/issues/18.

Joseph

>
> [obmc-console-client is just a *really* simple bridge between stdio and
> a unix domain socket. It doesn't own the network socket, nor do any
> authentication or authorisation]
>
> We can definitely do an optional timeout in obmc-console-client, but I
> want to make sure that's really what you want first.
>
> Cheers,
>
>
>
> Jeremy
>

