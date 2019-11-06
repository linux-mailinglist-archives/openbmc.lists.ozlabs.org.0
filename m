Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776AF0BE4
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 03:04:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4778wl6jjRzF31R
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 13:04:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HifvK/TX"; 
 dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4778tj1NshzF5FQ
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 13:02:36 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id r9so3627619ilq.10
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 18:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TyvQfrlFq3FPVSrQJuBkAeN5XsCsaJWUtRqjnx3/Vv8=;
 b=HifvK/TXqh3K/gRHtf91Wtjp2i9a0Uic+w0hZcOIhGwvPKWCNdRFxvmTRYBq1aymZ4
 pnksDF0yqUZ8D0jWMcuTpgNd0llyxJhcBPaRzjh/Oklc0fGRU+2eOsDFewz+XEzXTIh8
 n3OVWy9TiQy+4RNhpBKWWdm1CKYcBPz5S+74lpvr17IAkoR0cIEzBwzm+OUg8KTbrTqK
 WFlx4CsW3Z1vGNs6tj9x09CF6YO0xQjwcaDVqCIQc+rkOlF38FmxYMadgs6i2DncpIaM
 yx+ScXHIeAu6rYe9DrL3kJW+BGxB/YMmy3QWnCygvhifogGcbjJ7hEIHU33+N75WG8WV
 cBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TyvQfrlFq3FPVSrQJuBkAeN5XsCsaJWUtRqjnx3/Vv8=;
 b=KlBVF0LIX1MAmWAX7GSnCV/Oees/H3iYKh821i6728Wu6c1K6EtcGvz0xh5roWTSC8
 WlVQdAKKkN7u4km9mV6K8yD7NiqvRJ7kHLK6sIQ45JBCPePaXZkQhJIgKFFitxNnC8uI
 8EBR/O4iEraO9mYglyRABj9Jnkm6FqTabPmORkddXGJkeLf6vQzTGv/tBU5ER8lyyW2G
 QXLWAr8+hjps97op4WGjqAymEuKMYtcFFedeLyphbTX8DyWRh/tm0tj2tqLaw5oRZs7j
 CsUD7IJ0Wq5+g28Y0ExTTmVoWnixHAOkxP1HBGhVTR8n+nfSqn4s2iLtlv6qN12J1J+j
 IDHg==
X-Gm-Message-State: APjAAAVIxSEm2sV13wt67N8OESQIK4vHgdZn0DQx+PfxT8mZCgUw4t3x
 mu1hHLdGVCMzoOGiwOzbBSBoAvsvpNXsMaq262c=
X-Google-Smtp-Source: APXvYqz+R6FFOSzyu0WVgWIKYb38AD4kIhsDp2FBbxkb7pcaPtUmVdQ4fuJMjJ1n8qOrfOuWC7ulRCzEnJa1xT1sDFY=
X-Received: by 2002:a92:d484:: with SMTP id p4mr144939ilg.52.1573005752417;
 Tue, 05 Nov 2019 18:02:32 -0800 (PST)
MIME-Version: 1.0
References: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
 <CAARXrtnEOUuVdZpobxnQiJ-n0ve57fiP0nu8Yw-t5jMHWShXtA@mail.gmail.com>
 <E7046336-11A9-4D82-9DDC-6DB7DF94C8C5@fuzziesquirrel.com>
 <953ff1d9-294a-025e-7c10-91ec80b81e9e@linux.intel.com>
In-Reply-To: <953ff1d9-294a-025e-7c10-91ec80b81e9e@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 6 Nov 2019 10:02:21 +0800
Message-ID: <CAARXrtmYykUAGr015qhRc5VAZB20_cc7pqRXmDGYag_7vZiSvA@mail.gmail.com>
Subject: Re: HTTP redirect to HTTPS for web UI
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, George Liu <liuxiwei1013@gmail.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 6, 2019 at 1:20 AM James Feist <james.feist@linux.intel.com> wr=
ote:
>
> On 11/4/19 4:36 PM, Brad Bishop wrote:
> >
> >
> >> On Oct 31, 2019, at 11:26 PM, Lei YU <mine260309@gmail.com> wrote:
> >>
> >> On Thu, Oct 31, 2019 at 9:48 PM George Liu <liuxiwei1013@gmail.com> wr=
ote:
> >>>
> >>> Hi All:
> >>> I'm working on http redirect to https task(https://github.com/ibm-ope=
nbmc/dev/issues/895).
> >>> I took a cursory look at the design(https://gerrit.openbmc-project.xy=
z/c/openbmc/docs/+/24173) and did some testing.
> >>>
> >>> In bmcweb, I find it the current communication logic can only listen =
to one communication protocol (http or https). If you listen to both protoc=
ols at the same time, you need to change a lot of code and communication lo=
gic.
> >>> If we are going to implement this feature in bmcweb, it costs extra e=
ffort and it's likely the implementation is no better than Nginx. so I pref=
er to use Nginx.
> >>>
> >>
> >>>  From Ed's [mail in June][1], one approach is to use boost asio async=
_detect_ssl.
> >>
> >> But I agree with George here that it costs extra and unnecessary
> >> effort, because with nginx it is so easy to config the http->https
> >> redirection, and it is easy to get all the https related configs
> >> right, including HSTS.
> >> In other words, we got such features for free (except for a few binary
> >> size), why bother re-write it?
> >>
> >> Considering the binary size, maybe it's worth the effort to check how
> >> many bytes are increased compared between:
> >> 1. Current implement that bmcweb handles https only
> >> 2. Enable BMCWEB_INSECURE, opt-out all https related code in bmcweb,
> >> adding a basic nginx and a configure file that does the https
> >> redirect.
> >>
> >> We could check the binary size to see if it's acceptable. Be noted
> >> that implementing this feature in bmcweb increases the binary size as
> >> well.
> >>
> >>
> >> [1]: https://lists.ozlabs.org/pipermail/openbmc/2019-June/016557.html
> >
> > FWIW I generally support solutions that re-use existing software and ha=
ve large communities behind them already but I do remember Ed having some c=
oncerns about using bmcweb behind a proxy.
> >
> > James any chance you recall what those concerns were?  I don=E2=80=99t =
think I was ever able to wrap my head around them.  Do you share Ed=E2=80=
=99s concerns?
>
> I think these were the main concerns:
> https://security.stackexchange.com/a/107106
>
> Basically that since you're using HTTP, you leave yourself open for a
> man-in-the-middle attack. bmcweb does do the header trick mentioned in
> this post, so once you navigate to your bmc once, the browser remembers
> to always use https. I think that, along with potential binary size
> increases, were the biggest concerns. We also try to keep open the
> minimum number of ports in general as a best practice.
>

As the answer indicates "A way to mitigate this is to use an HSTS HTTP head=
er"
It's easy to configure nginx to use HSTS header, so it's no big deal.

The potential binary size increase is a valid concern, it's worthing
comparing the binary size with and without nginx.

> >
> > thx - brad
> >
