Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7491AB7CD
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 08:16:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492prd3mfPzDqbl
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 16:16:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=byy/cpY9; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492pb05pQjzDrMX
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 16:04:28 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id j4so20123064qkc.11
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 23:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TGJFpRPa5DMKxX0QnALBxlPf7YbN/6ch2iy6RBPNQyU=;
 b=byy/cpY9WEclSfvmOVIJfF512VwMct4Pp84elH5Y1LOKYTL3CzlieX5R/NEmelgZJK
 G0xe3Eerz5mPty6AvhkZi/Zi93eTeIP54z5EOkblN+FjXkQtih7/gq3c6RQwmOhGaNVO
 5tA7Lys5ymeH8bISdeU3NhTHWQ3APeZIGXS78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TGJFpRPa5DMKxX0QnALBxlPf7YbN/6ch2iy6RBPNQyU=;
 b=VTRydpCayAq3mE98C8ERqZvkhg/KPD1876NU+pFWvj/3C9vCAWRD7mdvkVPHjLbpVD
 K8UMiNKD2YmHm8X/N0gDwcTUsD6QWBKhEMT2XW51qgYp0P3dahild6CXd6r3QTDG576h
 LLkpf6SiBqZUueJsg+wGgJOXg2b7hXsxtS3wwO7vOuFO2thV7impwxprJIRNuDQoH0rU
 w7XNtYyZZJmTZibTw0/TShsi1INCQKg/yDGO9JAUhLiwF/5VoXpy0QkcOk4X6XD26wgN
 uX1UpEE3JOcCovbnvDSu5kA/5Z9Z45Qup7TcmbBdUEzMZj5rY68lS4uw9uJLWqYHuOmx
 dR8Q==
X-Gm-Message-State: AGi0PuaJoEYOkeOKJEJSD5825RecdM/mPqkDngGd0l4NDxnRFgqIGqk2
 ApYnakRezJytuk4juALi/NNzpDOZZg2rbBCbBqs/n/k6
X-Google-Smtp-Source: APiQypKFv/9PIQeWHWWiSgkdDyzKDIszmjy55ntBQ1Wz8RF7e5mnYDvgbw2+VD8Y//1XRM5uvep+VXmhYcj+TucGEm8=
X-Received: by 2002:a05:620a:13b5:: with SMTP id
 m21mr29580098qki.208.1587017064461; 
 Wed, 15 Apr 2020 23:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
 <c59d8a92-aabd-1a79-a97a-5947bb7ff4cc@linux.ibm.com>
 <20200414224248.GF9295@mauery.jf.intel.com>
In-Reply-To: <20200414224248.GF9295@mauery.jf.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Apr 2020 06:04:12 +0000
Message-ID: <CACPK8Xf8q5B2kBoEK0au4sw4F_PfC-XGffj784JemLoZOWQk2g@mail.gmail.com>
Subject: Re: ipmi password storage
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 14 Apr 2020 at 22:43, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> On 14-Apr-2020 05:03 PM, Joseph Reynolds wrote:
> >
> >
> >On 4/14/20 11:46 AM, Vernon Mauery wrote:
> >>On 14-Apr-2020 10:50 AM, Patrick Williams wrote:
> >>>On Mon, Apr 13, 2020 at 04:00:15PM -0700, Vernon Mauery wrote:
> >>>
> >>>Vernon,
> >>>
> >>>Is there some background pointers on why IPMI needs to store passwords
> >>>in a reverable way?  I never understood that.
> >>
> >>Sure. I think this is most clearly described in section 13.31 "RMCP+
> >>Authenticated Key-Exchange Protocol (RAKP)" in the IPMI v2 1.1 spec.
> >
> >This may be a bit naive....  Is it possible to expand the RCMP+ spec
> >with a new cipher suite or similar, to use a mechanism more like HTTPS
> >or SSH that does not require the server to be able to produce a clear
> >text password?  Given that IPMI will be used for many years, this
> >seems worthwhile, and would solve the current problem.
>
> While IPMI will not likely be abandoned for many years to come, there
> are not any plans to update the specification. Redfish is supposed to be
> the answer, but like IPv4 was supposed to be supplanted by IPv6 long
> ago, full adoption is still dragging its feet.
>
> That being said, I am not opposed to creating a new de-facto standard.
> In the name of security, I would not be opposed to using modern crypto
> protocols to establish secure IPMI sessions. This would likely cause the
> adoption of redfish to be even slower, because the biggest detractor of
> IPMI would be fixed.

This is a great suggestion.

> We have the maintainer of ipmitool as a member of the OpenBMC community,
> (Alexander Amelkin) so we could even implement both ends of this new
> de-facto standard. I would suggest a DTLS connection on UDP 623, fully
> replacing RCMP+.
