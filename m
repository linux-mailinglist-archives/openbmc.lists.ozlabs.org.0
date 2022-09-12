Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9A5B5E97
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 18:55:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRCQ70V0Bz3bZB
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 02:55:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OR5LnJjr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=nanzhou@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OR5LnJjr;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRCPg08S9z2xBF
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 02:54:45 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id gh9so21659419ejc.8
        for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9NDKPSb5xKKP3ykQHOa83XcvudMOj4arrJaq4WpArc8=;
        b=OR5LnJjrSLduBaY6F5lta85WnBv0cbsEW08he0UUIhwFoCJI4x8UvOTPRCjIZ1YEPy
         mdJ39W6D8PJGUOMkY0Aea2q3Gsjm9A0uSQ+5gbYV9whzznDwL3jkGsHfvStqzs6eD23i
         xjXxzf5a+b2avAmeDPz+jtp/47QL0OSLeAKrubFnAdCrkt36mq8DWkH8DEhuEeSlFMnM
         2z94eUBJIPUoIo6ZS/CYVE/BkTEkfMVMmJKgSpGSxika2Mh3iEeDHcKT9gt8TothAQ26
         u6GwNp25/loISe4uNNAUJZ2yzO0Y/Fl4e3WgmYfYUgi983WcTy7FOTlLImMxxB3NH/Zg
         qGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9NDKPSb5xKKP3ykQHOa83XcvudMOj4arrJaq4WpArc8=;
        b=VtUQQO70jNTF8hx9qQy0VmX4qs/vUcKio9p91pezIVa/4waHDVDxpv58C1Thxwo6QQ
         1LqULBmvCxp+R2y/k5eil+WNp0pVSOPelokf7H7sYTbPJL28utl3iQRJlBovrIdLKq2I
         ROMicA4lkzL0lehWZwTzCViwCQXARKojuzUBAqmBMDjBN6A5AZ4xNXNZ56H7Tf0E7OuC
         kgPRV+Ko0QjeF/rfISeiEwnF20XIMyl++L3sdKpgmV8eKXp+HTZrOCv9yYZHzwdPGgdh
         DqkZqodFcdTC6dB6bAv4arLH+PWaSlUUEYWI+7E9i1lGETFiK8uUgoF7QSne0BkUCY2k
         sWRg==
X-Gm-Message-State: ACgBeo38KO0tQrBnIOQ0TvIjr8dXjTadPxxOZ4fVFbuzXjcjoNPgSc1x
	OpGSIx2vB4rLxBoaf0Js/c8H65wkoyFGjKMEG0cZoA==
X-Google-Smtp-Source: AA6agR6W/rh4tkZrcWZB1Y2dlF/fe6n8vnwhEVdhDnrBzLeGbaveD7H53BQIAb+4alWU4mynpDIG6HqbTd5gK/YOpIg=
X-Received: by 2002:a17:906:fe04:b0:777:b13d:30a6 with SMTP id
 wy4-20020a170906fe0400b00777b13d30a6mr14177116ejb.248.1663001677586; Mon, 12
 Sep 2022 09:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <Ys6riEnZm5SP8v76@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAH2-KxBYyg240d48oNRbhNyRK+JkdWrzOcjrxs2JU959=NGP+A@mail.gmail.com> <CAOLfGj4fje3YBb+RTwXOPEpcNVf4O9bZ4CZhpe=Ai=J8baSf_Q@mail.gmail.com>
In-Reply-To: <CAOLfGj4fje3YBb+RTwXOPEpcNVf4O9bZ4CZhpe=Ai=J8baSf_Q@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Mon, 12 Sep 2022 09:54:26 -0700
Message-ID: <CAOLfGj6Rxi6+cVoSVqY=GPUV48wNNq8FFEy0mk_zVHrNab+oSw@mail.gmail.com>
Subject: Re: DBus ObjectManager Interface usages within the project
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="00000000000041ebd605e87dc031"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000041ebd605e87dc031
Content-Type: text/plain; charset="UTF-8"

I searched all the DIMM daemons in the org.
https://github.com/openbmc/openpower-vpd-parser/search?q=DIMM

Seems to me smbios-sdr is the only public repo. Are there any other repos
that implement the DIMM interface?

On Wed, Jul 13, 2022 at 5:49 PM Nan Zhou <nanzhou@google.com> wrote:

> I don't think "OM is optional" is really a true statement.  It is
>> optional from a dbus perspective, true, but practically speaking all of
>> our daemons have it (just at an inconsistent location).  One of the
>> primary features of the object manager is to emit the signals for
>> managed objects, such as PropertiesChanged.  If you don't have an object
>> manager you don't get those signals.  We have to have that on Sensors,
>> at least, and I'm pretty sure everyone adds them for Inventory as well.
>
>
> As you're seeing, there are typically two behaviors of implementation:
>
>
> 1. Anything using ASIO places OM at the root by default.
>> 2. Anything using PDI-bindings places the OM at the lowest common part
>>    in their hierarchy.  (Something like /xyz/openbmc_project/sensors or
>>    /xyz/openbmc_project typically).
>
>
> Is this documented somewhere formally so that when people ask or question
> about it, we can have a pointer.
>
> If not, is PDI a good place to place this requirement?
>
> On Wed, Jul 13, 2022 at 7:36 AM Ed Tanous <edtanous@google.com> wrote:
>
>> On Wed, Jul 13, 2022 at 4:24 AM Patrick Williams <patrick@stwcx.xyz>
>> wrote:
>> >
>> > On Tue, Jul 12, 2022 at 11:48:31AM -0700, Ed Tanous wrote:
>> > > We've had a couple cases in the project where patches have needed to
>> be
>> > > slowed down because of inconsistencies in our use of object manager,
>> so
>> > > IMO, the time has come to make our usage of ObjectManager consistent,
>> > > documented, and drop support for the (not upstream) daemons that don't
>> > > follow the rules.  As part of this, we will port forward all the
>> upstream
>> > > daemons to be consistent, and do our best to avoid bugs, but this
>> email is
>> > > intended to inform those that have non-upstream daemons about the
>> change so
>> > > they can resolve their implementations.
>> >
>> > There isn't much in the dbus spec that puts requirements on where the
>> > object manager is, but that certainly doesn't mean we can't add our own
>> > design requirements on top of it.  Thanks for starting this.
>> >
>> > > The basics:
>> > > ObjectManager DBus interface will now be required for any daemon
>> > > implementing a Sensor.Value interface or Inventory.Item interface.
>> > >
>> > > Daemons producing sensors will be required to place their
>> ObjectManager at
>> > > /xyz/openbmc_project/sensors
>> > > Daemons producing inventory items will be required to place their
>> > > ObjectManager at /xyz/openbmc_project/inventory.
>> > >
>> > > Both of these interfaces will be required to be published before
>> claiming a
>> > > well known name on dbus, to allow for the possibility of caching
>> > > implementations at some point in future.
>> >
>> > This means we can end up having N object managers in a single daemon if
>> > it is hosting multiple namespaces?  Why not just host it at
>> > /xyz/openbmc_project?
>>
>> Because rarely is the question being asked "What are all the openbmc
>> interfaces and values for those interfaces that this application
>> supports".  Usually the question is more specific, like "What sensors
>> does this application support".  If we had to get all the inventory
>> items, nics, and other stuff at the same time that we got all the
>> sensors, it would make the responses larger.
>>
>> >
>> > > This was discussed pretty heavily on discord in the #development
>> topic, and
>> > > some of the nitty gritty details on why this is needed is available
>> there,
>> > > as well as I'm happy to discuss here.  This is one of those nasty
>> > > spaghetti-code things that we've lived with for a while;  Hopefully
>> if we
>> > > can get this behind us, we can get some good real world performance
>> > > improvements.
>> >
>> > I see the background being discussed when I read through the history on
>> > #development, but I don't see the rationale on why this was chosen.  I
>> see one
>> > comment that placing the OM at / is "wrong" but I don't see any
>> justification.
>> > Why is ".../sensors" right but "/" or "/xyz/openbmc_project" is not?
>>
>> GetManagedObjects doesn't have a way to filter down further, and for
>> daemons that might return both, it's advantageous to be able to filter
>> down more and not return every interface in one response.
>>
>> >
>> > We had a good chunk of this discussion about 6 months back in
>> > phosphor-virtual-sensors where some Redfish code was broken against that
>> > daemon because it _was_ using "/xyz/openbmc_project/sensors" and there
>> > was a patch to move it to "/" which ended up getting merged.
>>
>> Yep, this is essentially the continuation of that discussion.
>>
>> > Fundamentally, I think it boiled down to neither being in opposition to
>> > the standard and there was a bunch of code that already implied "/" so
>> > it was the simplest way forward to achieve compatibility.
>> >
>> > >
>> > > Thoughts?
>> >
>> > I do think that moving the OM lower in the hierarchy is probably better
>> > because it allows us to have parts of the hierarchy which do not emit
>> > signals, where having it on "/" does not.  I'm just trying to understand
>> > (and hopefully document more) the rationale on why this choice was made.
>>
>> Sounds good.
>>
>> >
>> > --
>> > Patrick Williams
>>
>

--00000000000041ebd605e87dc031
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I searched all the DIMM=C2=A0daemons in the org.=C2=A0<a h=
ref=3D"https://github.com/openbmc/openpower-vpd-parser/search?q=3DDIMM">htt=
ps://github.com/openbmc/openpower-vpd-parser/search?q=3DDIMM</a><div><br></=
div><div>Seems to me smbios-sdr is the only public=C2=A0repo. Are there any=
 other repos that implement the DIMM interface?=C2=A0</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, =
2022 at 5:49 PM Nan Zhou &lt;<a href=3D"mailto:nanzhou@google.com">nanzhou@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">I don&#39;t think &quot;OM is optional&quot; is really a true statement.=
=C2=A0 It is<br>optional from a dbus perspective, true, but practically spe=
aking all of<br>our daemons have it (just at an inconsistent location).=C2=
=A0 One of the<br>primary features of the object manager is to emit the sig=
nals for<br>managed objects, such as PropertiesChanged.=C2=A0 If you don&#3=
9;t have an object<br>manager you don&#39;t get those signals.=C2=A0 We hav=
e to have that on Sensors,<br>at least, and I&#39;m pretty sure everyone ad=
ds them for Inventory as well.</blockquote><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">As you&#39;re seeing, there are typically two behavio=
rs of implementation:</blockquote><br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">1. Anything using ASIO places OM at the root by default.<br>2.=
 Anything using PDI-bindings places the OM at the lowest common part<br>=C2=
=A0 =C2=A0in their hierarchy.=C2=A0 (Something like /xyz/openbmc_project/se=
nsors or<br>=C2=A0 =C2=A0/xyz/openbmc_project typically).</blockquote><div>=
<br></div><div>Is this documented somewhere formally so that when people as=
k or question about it, we can have a pointer.</div><div><br></div><div>If =
not, is PDI a good place to place this requirement?</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, 20=
22 at 7:36 AM Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com" target=
=3D"_blank">edtanous@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Jul 13, 2022 at 4:24 AM Patrick Wi=
lliams &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@s=
twcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Jul 12, 2022 at 11:48:31AM -0700, Ed Tanous wrote:<br>
&gt; &gt; We&#39;ve had a couple cases in the project where patches have ne=
eded to be<br>
&gt; &gt; slowed down because of inconsistencies in our use of object manag=
er, so<br>
&gt; &gt; IMO, the time has come to make our usage of ObjectManager consist=
ent,<br>
&gt; &gt; documented, and drop support for the (not upstream) daemons that =
don&#39;t<br>
&gt; &gt; follow the rules.=C2=A0 As part of this, we will port forward all=
 the upstream<br>
&gt; &gt; daemons to be consistent, and do our best to avoid bugs, but this=
 email is<br>
&gt; &gt; intended to inform those that have non-upstream daemons about the=
 change so<br>
&gt; &gt; they can resolve their implementations.<br>
&gt;<br>
&gt; There isn&#39;t much in the dbus spec that puts requirements on where =
the<br>
&gt; object manager is, but that certainly doesn&#39;t mean we can&#39;t ad=
d our own<br>
&gt; design requirements on top of it.=C2=A0 Thanks for starting this.<br>
&gt;<br>
&gt; &gt; The basics:<br>
&gt; &gt; ObjectManager DBus interface will now be required for any daemon<=
br>
&gt; &gt; implementing a Sensor.Value interface or Inventory.Item interface=
.<br>
&gt; &gt;<br>
&gt; &gt; Daemons producing sensors will be required to place their ObjectM=
anager at<br>
&gt; &gt; /xyz/openbmc_project/sensors<br>
&gt; &gt; Daemons producing inventory items will be required to place their=
<br>
&gt; &gt; ObjectManager at /xyz/openbmc_project/inventory.<br>
&gt; &gt;<br>
&gt; &gt; Both of these interfaces will be required to be published before =
claiming a<br>
&gt; &gt; well known name on dbus, to allow for the possibility of caching<=
br>
&gt; &gt; implementations at some point in future.<br>
&gt;<br>
&gt; This means we can end up having N object managers in a single daemon i=
f<br>
&gt; it is hosting multiple namespaces?=C2=A0 Why not just host it at<br>
&gt; /xyz/openbmc_project?<br>
<br>
Because rarely is the question being asked &quot;What are all the openbmc<b=
r>
interfaces and values for those interfaces that this application<br>
supports&quot;.=C2=A0 Usually the question is more specific, like &quot;Wha=
t sensors<br>
does this application support&quot;.=C2=A0 If we had to get all the invento=
ry<br>
items, nics, and other stuff at the same time that we got all the<br>
sensors, it would make the responses larger.<br>
<br>
&gt;<br>
&gt; &gt; This was discussed pretty heavily on discord in the #development =
topic, and<br>
&gt; &gt; some of the nitty gritty details on why this is needed is availab=
le there,<br>
&gt; &gt; as well as I&#39;m happy to discuss here.=C2=A0 This is one of th=
ose nasty<br>
&gt; &gt; spaghetti-code things that we&#39;ve lived with for a while;=C2=
=A0 Hopefully if we<br>
&gt; &gt; can get this behind us, we can get some good real world performan=
ce<br>
&gt; &gt; improvements.<br>
&gt;<br>
&gt; I see the background being discussed when I read through the history o=
n<br>
&gt; #development, but I don&#39;t see the rationale on why this was chosen=
.=C2=A0 I see one<br>
&gt; comment that placing the OM at / is &quot;wrong&quot; but I don&#39;t =
see any justification.<br>
&gt; Why is &quot;.../sensors&quot; right but &quot;/&quot; or &quot;/xyz/o=
penbmc_project&quot; is not?<br>
<br>
GetManagedObjects doesn&#39;t have a way to filter down further, and for<br=
>
daemons that might return both, it&#39;s advantageous to be able to filter<=
br>
down more and not return every interface in one response.<br>
<br>
&gt;<br>
&gt; We had a good chunk of this discussion about 6 months back in<br>
&gt; phosphor-virtual-sensors where some Redfish code was broken against th=
at<br>
&gt; daemon because it _was_ using &quot;/xyz/openbmc_project/sensors&quot;=
 and there<br>
&gt; was a patch to move it to &quot;/&quot; which ended up getting merged.=
<br>
<br>
Yep, this is essentially the continuation of that discussion.<br>
<br>
&gt; Fundamentally, I think it boiled down to neither being in opposition t=
o<br>
&gt; the standard and there was a bunch of code that already implied &quot;=
/&quot; so<br>
&gt; it was the simplest way forward to achieve compatibility.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thoughts?<br>
&gt;<br>
&gt; I do think that moving the OM lower in the hierarchy is probably bette=
r<br>
&gt; because it allows us to have parts of the hierarchy which do not emit<=
br>
&gt; signals, where having it on &quot;/&quot; does not.=C2=A0 I&#39;m just=
 trying to understand<br>
&gt; (and hopefully document more) the rationale on why this choice was mad=
e.<br>
<br>
Sounds good.<br>
<br>
&gt;<br>
&gt; --<br>
&gt; Patrick Williams<br>
</blockquote></div>
</blockquote></div>

--00000000000041ebd605e87dc031--
