Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202713D239
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 03:34:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ypDW5QDvzDqM1
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 13:34:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PkoBu7R2; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ypCn6jCjzDqLx
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 13:33:41 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id m26so20814497ljc.13
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 18:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHnlV8rRJbRQ1g7OriUML9ZkHMOZTSLmQqwNoiuzQbE=;
 b=PkoBu7R2+vMem8BYxKrIQUukqTdP1/bdmXSDy5iRvApch5AV2zBUuv+3vHYpfWRccW
 L7XtyJhKbRtwvAw7UIROhoKz8XtKsKht/jcCldjDldViSGcePxT1XY4pCBWS5vk8lUgP
 1M+rE61VqEfltGSEwIh51iksctHE55scXFKhgCQntZAx7aPSGRrO86R9OnhoAIR23cIW
 elPI5iyrXm5/5sTn+kioizZ+CbDWpv4VoU1NbcJZSiGk9xSM3YKBInz2UrcHTmIjW/ad
 gpQLru6fRDgGi8YEnGXavXXQUKa3atPbEjZvLTXqwUw3gE1E8gg8n/URUUTTyFkUymMn
 3Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHnlV8rRJbRQ1g7OriUML9ZkHMOZTSLmQqwNoiuzQbE=;
 b=XH2ZA2gmmOltWR3OOfyySWs3BUaVUaDkt+0CIMe86kD/qP85/SA6RaDpsx4FHRuQ1R
 CHt3c+uGuDEZU9pcx5TOVrLYqXO5h2cEO3ivG34NW7URpPVZlL/LVdiwNEZ7T6YxIrov
 Lu1HBEbkvdDjOdu4Jh44KXlGVXvaIOKR67Rcqk2IIPv4iq5IoDj+PCsLtRCX6lRF6r6O
 oOcw8BkwbT/jIoTTEd9FB67k331LGvWXVG84iTN33cuhTfwUhXzETO4rTVXfxghectPQ
 UgJVRtcB7pKRUo1hviL/oIoZidAXmRFR1KkgqSaySENQSUNaSUgZra3yYRR2GoyQOZV/
 FZLw==
X-Gm-Message-State: APjAAAXFdY78np+HG8G2rFRT0bd/lXSVA4ulDzRXOsv8le/ThsymE32P
 1+S0cnot4tPd2L7T5+epPtPdojT6Lqs7syJWnXE=
X-Google-Smtp-Source: APXvYqypSjA4Pq6ItjnE3amwP/gw3sExPZsL5SCw0b6aIPwy7Un4owbBm2cQEoqOXSSVPc9kZoStMi9M9gY1ICK3u5w=
X-Received: by 2002:a05:651c:1a8:: with SMTP id
 c8mr815703ljn.207.1579142016971; 
 Wed, 15 Jan 2020 18:33:36 -0800 (PST)
MIME-Version: 1.0
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
 <138261238.19427827.1579077694127@mail.yahoo.com>
 <3ae17538-5e0d-1228-a242-56ab25dd3229@linux.intel.com>
 <20200115192701.GD3512@patrickw3-mbp.dhcp.thefacebook.com>
 <90469760-8693-9481-524a-1b3d92825df2@linux.intel.com>
In-Reply-To: <90469760-8693-9481-524a-1b3d92825df2@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 16 Jan 2020 10:33:25 +0800
Message-ID: <CAARXrtmA_Tj-CLpUdg4NJssHFwe0qpOEmvU=xGLtAvp99iW2-A@mail.gmail.com>
Subject: Re: No sensors displayed in webUI
To: James Feist <james.feist@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Max Power <max_power2005-openbmc@yahoo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 4:46 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 1/15/20 11:27 AM, Patrick Williams wrote:
> > On Wed, Jan 15, 2020 at 09:26:48AM -0800, James Feist wrote:
> >> There was a thread about this last week:
> >>
> >> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020044.html
> >> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020136.html
> >>
> >> TL;DR all the sensors are available in Redfish, but the WebUI hasn't move
> >> over to full Redfish support yet. There is a test patch that helps enable
> >> this in the thread.
> >
> > Hi James,
> >
> > This statement about a dependency on Redfish stood out to me.  The
> > current UI is mostly using the "old" REST API, but as long as the dbus
> > objects are created correctly it should not matter one bit if the
> > external interface is the dbus-based REST API or the Redfish one.
> >
> > This is a bug in dbus-sensors that is independent of Redfish vs REST.
> >
> > The current webui code expects there to be properties that are specified
> > in phosphor-dbus-interfaces.  Specifically, it is looking for the "Unit"
> > property[1], which is a required property on
> > xyz.openbmc_project.Sensor.Value[2].  The dbus-sensors has a bunch of
> > Sensor.Value objects that are violating the interface spec by not
> > providing "Unit" [3].  Notice that `setInitialProperties` doesn't
> > register_property on "Unit" and neither does any other code in this
> > repository[4].
> >
> > Why is none of this code using the code generated from
> > phosphor-dbus-interfaces?  Since it is generating dbus objects "by
> > hand" it isn't not getting any compile-time checking if it is doing the
> > wrong thing (or more likely that the phosphor-dbus-interface changes out
> > from underneath it).
>
> There is a long history of this where I tried to get everyone to update
> the sensor value interface to use double instead of INT. I had a large
> agreement, but unfortunately updating all of the daemons that we did not
> use (and without any good way of testing), and trying to get by-in or
> help from all the maintainers became too large of a job. I updated as
> many daemons as I could to accept both before I ran out of time. At the
> same time, I was also phasing out unit, as unit was easy enough to read
> from the sensor path, and redundant information. All of our internal
> daemons don't use phosphor-dbus-interfaces to create interfaces, as we
> have found the code generation difficult to explain to new users, and it
> also makes it difficult to upgrade daemons as all patches need to be
> merged at once. We have been updating interfaces for documentation
> purposes, but haven't used them for any new work in quite some time.
>

This is really an issue.
Typically an OpenBMC service will use the data types defined in
phosphor-dbus-interface, when it does not, it causes such trouble:

When I worked on a change in bmcweb to update some sensor value, it's
found that bmcweb is not using the correct type causing runtime D-Bus
exception.
And the code has to be changed to handle both types, where one is
defined in phosphor-dbus-interface, and the other is un-documented.

It's really appreciated if we could use the unified interface.

>
> >
> > [1] https://github.com/openbmc/phosphor-webui/blob/f70f42553615972163b36c9b4d77be07e4399122/app/common/services/api-utils.js#L979
> > [2] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L32
> > [3] https://github.com/openbmc/dbus-sensors/blob/fbb44ad1ea716d4e8c2cacdf01d380c6d0f53855/include/sensor.hpp#L13
> > [4] https://github.com/openbmc/dbus-sensors/search?utf8=%E2%9C%93&q=unit&type=
> >
