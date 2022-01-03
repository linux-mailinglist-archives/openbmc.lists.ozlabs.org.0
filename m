Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E499483836
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 22:10:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JST142ry3z2yXv
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 08:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=I1v0mQSm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ROehNgOX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=I1v0mQSm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ROehNgOX; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JST0Y3VTxz2xBq
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jan 2022 08:10:03 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A19A5C01D6;
 Mon,  3 Jan 2022 16:09:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 03 Jan 2022 16:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 content-type:content-transfer-encoding:from:mime-version:subject
 :date:message-id:references:cc:in-reply-to:to; s=fm3; bh=j9GDsVK
 p6q2TImq9eB45w2d82e39AiBlnjGCoPP9qPg=; b=I1v0mQSmulzhJPnuKzSq65o
 T+VwxeXoWghiZAepyKb08Z2qha4OMVolsA0SxO1Kt63eBRk0Ll23WiqfzuR3nIva
 JxBAozrBg62ut4Bkr2jqnWr9b/9Pjz0+oRfloav0YNUrlNwgnwVrPKka/GEbhyxQ
 erjTTdxcOSXrG4vu7oWeO1UO0WTCZqW7yRYZDtmizzdlzEF6lA5b7RLJ0GHczLfP
 SxLWktY2VT0y8pd23F1sL2iZelyExBJ/00F+MNg08HVGxZLGlXth64cqmXWRKQpt
 pzPVrg+wh7/PifIZAM2totBThXIbbLEWx/uuRmE7p1V9yyYbH+4VXXM351stN3w=
 =
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=j9GDsVKp6q2TImq9eB45w2d82e39AiBlnjGCoPP9q
 Pg=; b=ROehNgOXSIoCpZHML0JvfDCltGp/haRowmf2EqD+u9Sl89BZ0bavik2jD
 3uGC7tqHoBgKIO0jqNeiH21r0ionZC2xAxWtU521UuqWXzjcgdRhvUQYVXMywI6/
 eksrSEY/Z+XqHBSEVjV9Pqx49IBMExs72bJIXdi7S4YbzUKeGkAUKG994S+ySMZJ
 cOkMihw2ZJtkSZ6JbWRJuEuazb1toRCKrRTi25UHsnxN/CALMDd6XA528CrdZJ7X
 lUI6UNIfq9eZ874hIZEuCWFiaZWPez8Q9EYSJ1oNa89K+E5s5+UL5JYT+2ezAh9a
 eRObmSS+eeT0DJg/qnK3imC9uo6Nw==
X-ME-Sender: <xms:JGbTYfZEqg2E0rUgXUg0GjA6DtFGyUZEy3UWZLj-aD0ODx0rzxnKCA>
 <xme:JGbTYeZ8Mvpk18e8NB1jGQfY0JHNqElPRtzMsS1jDePfLRwpLqV92ZyYMKkXP01Jf
 HJAxkAuRpzrq9bGquw>
X-ME-Received: <xmr:JGbTYR8qHnMR129JhpkjTMMFdStt-oRONTFn3X7dRQsHF38snfcERAMnt6boU079s7YIBtY_RJszz02pIsb3zWAmEG-TqHnZbPXvoyzf_YkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefuddgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddvfedmnecujfgurheptgfghfggufffkfhfjgfvofesthhqmhdt
 hhdtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
 esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfegjefhfeeftdevjeeifeef
 vdejieekhffgvdehtedutdejleegjedugfduveevnecuffhomhgrihhnpehgihhthhhusg
 drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:JGbTYVo1Jxli4vq0Xw0_rVKM5BGeIP2e0AE3p8L7Vixxbux46KeCVQ>
 <xmx:JGbTYapX3GY_EWZzEC_XMItd4zyUFNXsqYDQlcRDbLzdEi6qFAaIag>
 <xmx:JGbTYbSrMoBjKOFWq_GSWLE1K37ofDkKgGIr0QWQ-KbSeKllW7AuBQ>
 <xmx:JWbTYXDHIQGDcXGp_NmI0w_2fIvrKzBqVWm17mdVFuGKzvWXaLGQVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Jan 2022 16:09:56 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Patrick Williams <patrick@stwcx.xyz>
Mime-Version: 1.0 (1.0)
Subject: Re: hwmontempsensor issue in dbus-sensor
Date: Mon, 3 Jan 2022 15:09:54 -0600
Message-Id: <8589D844-7432-4C87-9CF0-71C6303228DF@stwcx.xyz>
References: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
In-Reply-To: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>
X-Mailer: iPhone Mail (19B74)
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jayashree D <jayashree-d@hcl.com>,
 Kumar Thangavel <kumarthangavel.hcl@gmail.com>,
 Ed Tanous <edtanous@google.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ed,

I think there are other commits needing the IIO functionality now. There is a=
t least the pending commit for Humidity that we=E2=80=99d like to get merged=
. I think it is better to move forward with a fix rather than backwards with=
 a revert at this point.=20

Kumar/Jayashree,

Can you dig into this and get to the bottom of it?

- Patrick
Sent from my iPhone

> On Jan 3, 2022, at 11:21 AM, Ed Tanous <ed@tanous.net> wrote:
>=20
> =EF=BB=BFOn Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell
> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>=20
>>> On 12/20/2021 10:29, Ed Tanous wrote:
>>> On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
>>> <kumarthangavel.hcl@gmail.com> wrote:
>>>>=20
>>>> Hi All,
>>>>=20
>>>> Gentle Reminder on this.
>>>>=20
>>>> Thanks,
>>>> Kumar.
>>>>=20
>>>> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <kumarthangavel.hcl@gma=
il.com> wrote:
>>>>>=20
>>>>> Hi All,
>>>>>=20
>>>>>=20
>>>>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor=
.
>>>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d68=
4c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e=
5341b22b7ab
>>>=20
>>> Bruce, this is your patch.  Could you take a look at the below and
>>> provide your input?
>>>=20
>>>>>=20
>>>>>=20
>>>>> While testing those changes in my platform, I found that each sensor i=
n hwmon temp has been creating twice.
>>>>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is c=
reated twice.
>>>>>=20
>>>>>=20
>>>>> /sys/class/hwmon/hwmon2/temp2_input
>>>>> /sys/class/hwmon/hwmon2/temp1_input
>>>>>=20
>>>>>=20
>>>>> Before your change, hwmon temp sensor will check whether the path is a=
lready exists or not.
>>>>> If it exists, it will skip and proceed with next path.
>>>>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d68=
4c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e=
5341b22b7abL96
>>>>>=20
>>>>>=20
>>>>> Could you please explain why it is creating twice in hwmon temp ?
>>>>>=20
>>>>>=20
>>>>> Journalctl log before your changes applied :
>>>>>=20
>>>>>=20
>>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hw=
mon/hwmon2/temp2_input"
>>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type : xyz.openbmc_pr=
oject.Configuration.TMP421
>>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP=

>>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/open=
bmc_project/sensors/temperature/SP_OUTLET_TEMP
>>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/open=
bmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hw=
mon/hwmon2/temp1_input"
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> Journalctl log after your changes applied :
>>>>>=20
>>>>>=20
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hw=
mon/hwmon2/temp2_input"
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.ope=
nbmc_project.Configuration.TMP421
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP=

>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_p=
roject/sensors/temperature/SP_OUTLET_TEMP
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_p=
roject/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>>>=20
>>>>>=20
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hw=
mon/hwmon2/temp1_input"
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.ope=
nbmc_project.Configuration.TMP421
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP=

>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_p=
roject/sensors/temperature/SP_OUTLET_TEMP
>>>>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_p=
roject/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> Thanks,
>>>>>=20
>>>>> Kumar.
>>=20
>> I will give it quick look today.  Also today is my last day at IBM.
>>=20
>=20
> Do you plan on continuing this beyond your tenure at IBM?  If not, is
> someone taking this feature over for you?  Given it's been a few weeks
> since this regression was reported, and I don't see any fixes in
> review, I'm leaning toward reverting it on master for the time being
> until someone puts up a patch to fix the issue.

