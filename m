Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668B23F526
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 01:18:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNh9m0w5TzDqkh
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 09:18:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=CNPYVDda; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNh8y36TmzDqZx
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 09:17:37 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id e14so1844551ybf.4
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wJqi492XtZnyvMjqqQ2NIATpTOeuyeKXyO/E2gfAt1I=;
 b=CNPYVDdaigiTNG13+BqjMiAjkqucERb4bsy+u63nDkUnWkkVChEKZM5XQDp0nt6TV2
 lCeXTWeQpJx0byOJB8x9tDGKle80SNkQILIgjee51Ce8il/qIZmbVfTh5yyTwtpzNKk7
 ziKjnc+rFhrr7eViY7Cppuv84YipdHSdakJq7v+VQFdHBp/mtrD7f7HTQnq4gUAOlH6l
 nYVBG/Cq4KiVYO7hktTK5U9pt3ASVZje31Dw2pL9UESOVaqpRZ+9D/YcnqR0vmKecCJt
 Oi1zsxSNo8fEJ0IQ4T+iNIn7G3oWXRtRMktKS9uFUqHnNywiazSnLEu6JH71TqC89PDT
 A0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wJqi492XtZnyvMjqqQ2NIATpTOeuyeKXyO/E2gfAt1I=;
 b=TW5OPONUO52omWlwLI5yMlXAKBdFWqUqbmoimFw3ZS3scIjR5NUQxeenWZlff5rKDJ
 RhikQXIIU8ndTAicE4tPylN8t+iCH8UumPPtgw3hUQ707nRdThtZhGVD3rVy6P5YX9/4
 WaOgU6ifSn70XAWZKSzcwG3zd8bvQ5GIoYUyWusS2NgpqPojZ/+V2yuYGnCc1pl0jnzm
 6NsHQkZz35+8k5ir2TkPno67SzxDCMQHBwFOSKAJUE2q8s7idpDp2JdiHcW9JtHHTpqF
 U1pvFwgYQheEMwVJREZEBiA/GAeKEdf4/4LiujwC8jnCuc/EX6BYyPpHrZLPO6VjpBiw
 yF+g==
X-Gm-Message-State: AOAM531PJ8WRzr/dESM6pR4l/Mn6THLDprUmW2l+7OhE2dEyTDQtdMSh
 y3PI9/PGJE7dy+quXGjrrcfE7hFJRw4WZruRVp20AQ==
X-Google-Smtp-Source: ABdhPJzXKI9NL4YBYlmc/YZfVyBPBTuqTai+Ag0UvMOzDIAAxunx5g2VabpUfUNDUZPUekwHIbOkowB3bi69LFXjNU4=
X-Received: by 2002:a25:d98f:: with SMTP id
 q137mr21597044ybg.480.1596842252206; 
 Fri, 07 Aug 2020 16:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
In-Reply-To: <CAA_a9xKze8pBf1zH0icAhQX55ESbtnqQMaTe-aTxnxBx5tfcCA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 7 Aug 2020 16:17:20 -0700
Message-ID: <CACWQX82Or8bnTA8WDqrogpp16vEff7PoEB4ZK4b3tFwYKWSQZQ@mail.gmail.com>
Subject: Re: Inconsistent performance of dbus call GetManagedObjects to
 PSUSensor in dbus-sensors
To: Alex Qiu <xqiu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Drew Macrae <drewmacrae@google.com>, Jie Yang <jjy@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Josh Lehan <krellan@google.com>,
 James Feist <james.feist@linux.intel.com>, Sui Chen <suichen@google.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is great!  Thank you for taking the time to type this up.

On Fri, Aug 7, 2020 at 3:42 PM Alex Qiu <xqiu@google.com> wrote:
>
> The setup has a total of 249 IPMI sensors, and among these, dbus-sensors =
reports 59 objects from HwmonTempSensor and 195 objects from PSUSensor, and=
 we've already decreased the polling rate of PSUSensor to every 10 seconds =
to mitigate the issue. As the intel-ipmi-oem does, we measure the time of c=
alling GetManagedObjects with commands:

This isn't the biggest sensor usage I've ever seen, but it certainly
is the biggest usage of PSUsensor I've seen sofar.  It's not
surprising you're finding performance issues other people haven't.
PSUSensor was originally supposed to be for physical pmbus power
supplies, but got abstracted a little at some point to be more
generic.

>
> time busctl call xyz.openbmc_project.HwmonTempSensor / org.freedesktop.DB=
us.ObjectManager GetManagedObjects
> time busctl call xyz.openbmc_project.PSUSensor / org.freedesktop.DBus.Obj=
ectManager GetManagedObjects
>
> The first command for HwmonTempSensor constantly finishes in about 60 ms.=
 However, the run time of the second command for PSUSensor is very inconsis=
tent. Out of 50 continuous runs, most of them finish in about 150 ms, but 2=
 or 3 of them will take as long as about 6 seconds to return. This results =
in long time to scan the SDR and inconsistent performance polling IPMI sens=
ors.
>

I don't have a system handy that uses PSUSensor, but based on what
you're saying, I'm going to guess that there's a blocking
io/wait/sleep call that snuck in somewhere in the PSUsensor, and it's
stopping the main reactor for some amount of time.  This is probably
exacerbated by how loaded your system is, which is causing the really
bad tail latencies.

If I were in your shoes, the first thing I would do is to recompile
PSUSensor with IO handler tracking enabled:
https://www.boost.org/doc/libs/1_73_0/doc/html/boost_asio/overview/core/han=
dler_tracking.html

to do that, go here:
https://github.com/openbmc/dbus-sensors/blob/master/CMakeLists.txt#L194

add add a line line like
target_compile_definitions(psusensor PUBLIC
-DBOOST_ASIO_ENABLE_HANDLER_TRACKING)

and recompile.

That's going to print loads of debug info to the console when it runs.
Be prepared.  Rerun your test with the flag enabled.  When your
getmanagedobjects command gets stuck, dump the log and try to find the
spot where io seems to stop for a bit.  Hopefully you'll find one
async operation is taking a looooong time to run.  Most operations
should be in the order of micro/milliseconds for runtime.  Once you
know what the spot is, we can probably triage further.  Each
individual callback is pretty simple, and only does a couple things,
so it should be pretty easy to sort out what's blocking within a given
callback.


My second theory is that because of the async nature of psusensor, if
you get unlucky, 195 concurrent IO completion operations are getting
scheduled right ahead of your GetManagedObjects call.  Right now the
IO scheduling is pretty dumb, and doesn't attempt to add jitter to
randomize the call starts, under the assumption that the reactor will
never be more than 10 or so handles at a given time.  Given the number
of sensors you've got, we might want to rethink that, and try to
spread them out in time a little.  If we wanted to verify this, we
could instrument io_context with a little run_for() magic that breaks
every N milliseconds and prints the size of the queue.  That could
verify that we're running it too large.

Technically I think this is the embedded version of the thundering
herd problem.  There are ways to solve it that should be relatively
easy (if that's what it turns out to be).
