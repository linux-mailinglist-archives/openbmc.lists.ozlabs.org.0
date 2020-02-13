Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9526115CC74
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 21:39:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JSzD0Q7JzDqWh
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 07:39:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IRQcbmJB; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JSyG1kWTzDqVj
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 07:38:13 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id j132so7178785oih.9
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=r+0/H6NzHJJdMGDslAW9Eiis77Y8VOMGIy+D66r09Jc=;
 b=IRQcbmJB38PTMH87iD2M8/tDnCl+tnxo+i3bK2OCwJxTXd3Gn4nWdfHgd7Fp6+WJUM
 AqwJEIkTqZiQ85dbFkuh3yg6wLDvJ1x9SqhitWDg/qiAcSD3dzjo86r1bFC9IEERwdZ3
 bUS1KgZ8W3iHlntfGb+ZqZZYos7s1OemfZlrMD+5+XRlslZiE6eHl8P6w01ur1KFN2ie
 ENAqAFHKktgI3Di3BqyZwaVr42inErlYRlMNHrCjfOe4yCbPaozbRcr6xIKCB6X/eKBa
 lQiaGxDYK5WuXUr5/tdEwP4bZvwfmw1jfgl+ifrARPdyNw8SQqFhJx5UnNGivyhB3JRk
 t86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=r+0/H6NzHJJdMGDslAW9Eiis77Y8VOMGIy+D66r09Jc=;
 b=M9TopMHiN4lomXYQ4BaidSy0BCgz8zU+sZmN6CdGFiTQ+a554oiW1k2XOxRVNpBXgF
 7nlpdOXkzlPnAhqJdL+C58iisflW5rA4UVHUV0e815VkAzKPC9T/NdUKQy5eoZgU4O0+
 tWZ0seBBT2/8kUwe3T4xXyHFeD5Fpo+Af4jDryDcQCOQZ7o1qfUjffKNH+a35LFjNeho
 PllmhufFRSAaB9ZUsQHyzCtW8Il/EDio9HX15Spumj2nyhS4BqWddd9lmuzjut1/rPmI
 GwKVPtD7nV5Ezhz0JQ0F+CzORaVs9avgrSWU9QIc0loVd5qzQ/Wqvd/82Zft37IUVEM+
 Gw9Q==
X-Gm-Message-State: APjAAAWEpnqcSf/0RLovoJ4JTOFeXhuHM6zmxR/aGNWnoiXXkXf5miVn
 fYb42I162gjTlVst2LWRy4apgg1+KOY=
X-Google-Smtp-Source: APXvYqxciDcyila3zkIGbKL27yY+ivXj2WJPvSgK8pXxOYjIHhlJ3o3JLKi56HcTavkKmL3Gag3hOw==
X-Received: by 2002:aca:3542:: with SMTP id c63mr4261984oia.135.1581626290811; 
 Thu, 13 Feb 2020 12:38:10 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id w8sm1140932ote.80.2020.02.13.12.38.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Feb 2020 12:38:10 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Enabling OpenBMC Debug
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <c012602f-281a-0cc7-961d-67599cf679be@linux.vnet.ibm.com>
Date: Thu, 13 Feb 2020 14:38:09 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <89071F06-BF4C-45D4-A5BB-CF184A4CEC79@gmail.com>
References: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
 <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
 <c012602f-281a-0cc7-961d-67599cf679be@linux.vnet.ibm.com>
To: Justin Thaler <thalerj@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 12, 2020, at 2:28 PM, Justin Thaler =
<thalerj@linux.vnet.ibm.com> wrote:
>=20
> This is a really good set of information! I must say I think the =
obmcutil command is a good idea, for development purposes.
>=20
> On 2/11/20 11:58 AM, Joseph Reynolds wrote:
>> On 2/11/20 9:51 AM, Andrew Geissler wrote:
>>> I find myself running a lot of different commands to enable a =
variety of
>>> debug data on OpenBMC when debugging different issues (usually BIOS
>>> communication issues). I also end up giving these commands to a lot =
of people
>>> when recreating issues for me. Stuff like this:
>>>=20
>>> # enable debug logs in journal
>>> sed -i 's/info/debug/' =
/lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
>>> systemctl restart systemd-journald.service
>>>=20
>>> # Enable BIOS communication service debug
>>> sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
>>> sed -i 's/btbridged/btbridged --vv/' =
/lib/systemd/system/org.openbmc.HostIpmi.service
>>> sed -i 's/ipmid/ipmid -d 0xff/'  =
/lib/systemd/system/phosphor-ipmi-host.service
>>> sed -i 's/0/1/' /etc/default/pldmd
>>> systemctl daemon-reload
>>> systemctl restart mboxd.service
>>> systemctl restart org.openbmc.HostIpmi.service
>>> systemctl restart phosphor-ipmi-host.service
>>> systemctl restart pldmd.service
>>>=20
>>> I was contemplating wrapping the above stuff in a obmcutil command =
so instead
>>> of telling people to do all of the above (and dealing with =
situations when
>>> those commands change), I could say something like run "obmcutil =
debugon".
>>>=20
> What about a REST API command tied to this? It could help when dealing =
with external to BMC problems.

No more generic REST API=E2=80=99s :) But in my response to Joseph I did =
ponder whether
we could get something added to Redfish for this. Enabling extra debug =
on a system
seems like a fairly normal use case.

>=20
>>> Any thoughts out there? Would finer granularity of the debug be =
useful?
>>> Are there other forms of debug people would like enabled?
> Sometimes we have to recreate issues that occur on a system, a rather =
unfortunate situation in and of itself. I'll have to counter with a =
question of my own. Do you think this would be good to enable during a =
recreate, and we don't risk flooding the useful info?

Yes, ideally we don=E2=80=99t need the recreate but when we do, having =
the ability to
enable extra debug without a lot of work could be quite useful.

>=20
>=20
>> Thank you for the information.  I keep learning all the time.
>> These settings factor into service scenarios and also deployment =
readiness.  For example:
>> - I want to turn off debug.  For example, I want a debug-off command.
>> - I would want a way to validate (or at least show) these settings =
when testing firmware image release candidates.  For example, another =
obmcutil command "debug-show" which uses "grep -H" instead of "sed".
>> - I would want some documentation added the BMC administrator's guide =
to make them aware of OpenBMC debug support.  Draft: The obmcutil =
command can control debug settings for a variety of the components =
running on the BMC.  For more information, see =
https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil
>> The obmcutil tool is a shell script, so folks can take just the =
pieces they need.  That is, don't be more granular at this time.
>> In summary, it seems like a good idea.  It seems like we should ask =
our service architects to weight in.  I'll go ask mine....
>> - Joseph
>>>=20
>>> Andrew
> Thanks,
> Justin

