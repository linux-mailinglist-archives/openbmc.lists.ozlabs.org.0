Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A06FCEFA
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 22:01:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG8DS0RkSz3fNd
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 06:01:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZfyHXJNf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZfyHXJNf;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG8Cs3rygz3fLr
	for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 06:00:40 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b9e2b65d006so9548781276.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683662435; x=1686254435;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXhrc7Hv9ntIG7Yk9Ab1X0BW6MrFByRJBbL87EvTWwc=;
        b=ZfyHXJNfV7Z1+UDM1C2Bs9w8WWY3HsT/yJK+ovG6fyQ1mpXZ7yFrq0UqVw58QSspmy
         c+xx9NQK900B9y7AR2ai2kMJtPk2i+CaSIFfTEH9DU00+JACYPXY+4zJFL3Jc+xUeCYm
         yxlr46V6hDVNvi8WW4A8yaSSNkXqpHluM+ZQbLSmB9fJ+cInvmRVujFuGBgM4Bqahvh3
         yTRHAPa4Kn7MmmOqqRf2QFni0N0YhmDL5L6RFGl0fzuHqml6BBuekY5lETd0QEKNMsN7
         CoC2QBOt4jriLrDtN/HBEYNlEbqkByrmoJAftSlNxRicdTLJiFxoQwRB+UlW+dZl+nIl
         FBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683662435; x=1686254435;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXhrc7Hv9ntIG7Yk9Ab1X0BW6MrFByRJBbL87EvTWwc=;
        b=QMjt4Nl2tTbgcALmoeJBFleVJVFZ4Hvb6TMUW8dXoG6dyZDPUTN2ifj48OQSrATn7x
         zUvMX+1K/wPFG2Fn+/i+GwQgagM0/m7Hw6WBXz1mpfW8AQPjlWptI9rlz0lUaI60hpae
         VIYyA7xR6DyoUcBWADcdcY6wZLPWHUSpk+ZIu1af8xJ2Mo8keeC7OUVzldGXu7o3AgdS
         AksFNDlqQ63cjD1xUE9OMHUlpQazFZ6307IQgMLVT0JZF3+A1mQUNEoEOqzDd119XlsV
         PzrGOdMFeJX4Hp2Bzo2vLphBal6iuvgsqzuajwqGcE351gvtkvPRm0uUqZ3IKsJp8Rc0
         YzPQ==
X-Gm-Message-State: AC+VfDzAWEPdkI0SSznRhZ+7o80T9ltIYCB90oiSIFV3OCJypJHGML+Q
	pgVmeiNKe7Pp4puswbhhTyTDgff0Kv4/eg==
X-Google-Smtp-Source: ACHHUZ6a4eYv8svKd4OnF9SibnRPhDdR0rPjWfw0fE16sTVdwL/aFZZ2M7xlM/sTgSyTz2vwbPp2iA==
X-Received: by 2002:a25:21d6:0:b0:ba1:67e4:e62b with SMTP id h205-20020a2521d6000000b00ba167e4e62bmr14033490ybh.13.1683662435316;
        Tue, 09 May 2023 13:00:35 -0700 (PDT)
Received: from smtpclient.apple ([67.220.1.27])
        by smtp.gmail.com with ESMTPSA id m124-20020a255882000000b00b8f46d74e5dsm3210172ybb.37.2023.05.09.13.00.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 May 2023 13:00:35 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <48E1A495-C402-4FF5-BEE7-CB883B076D10@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_145D31AA-6C35-460F-A40A-272C15796F39"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: Preventing a system power on before BMC Ready
Date: Tue, 9 May 2023 15:00:33 -0500
In-Reply-To: <CACWQX81Tg+22k=bwniGG4Brvj5uENM_ZXOg5B=9fOCKMfKKyLw@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>,
 Michael Richardson <mcr@sandelman.ca>
References: <0992ABFC-7CD8-4E4E-8731-167E59C8A9F7@gmail.com>
 <CACWQX81Tg+22k=bwniGG4Brvj5uENM_ZXOg5B=9fOCKMfKKyLw@mail.gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_145D31AA-6C35-460F-A40A-272C15796F39
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 2, 2023, at 7:48 PM, Ed Tanous <ed@tanous.net> wrote:
>=20
>=20
>=20
> On Tue, May 2, 2023 at 1:49=E2=80=AFPM Andrew Geissler =
<geissonator@gmail.com <mailto:geissonator@gmail.com>> wrote:
> >
> > That got us brainstorming about some possible solutions:
> > - Write some code in bmcweb to send a =E2=80=9Cbmc state change =
event=E2=80=9D anytime bmcweb
> >   comes up to ensure listening clients know =E2=80=9Csomething=E2=80=9D=
 has happened
> > - Add an optional compile option to bmcweb (or =
PSM/x86-power-control) to require
> >   BMC Ready before issuing chassis or system POST requests (return =
error if not
> >   at Ready)
>=20
> PSM or x86-power-control mods would be my preference.  bmcweb should =
not be in charge of business logic.  If the system shouldn't allow power =
on while the bmc is in ready state, then the daemons that handle power =
on need to have that as a constraint, otherwise you'd have the same =
problem if a user tried from IPMI.

Thanks for the responses guys. I=E2=80=99m going to go down the path of =
an optional config
option to PSM that will require BMC Ready for chassis or host =
operations. It will
return a well defined d-bus error that bmcweb can look at and return an =
error
to the redfish client indicating the operation is not possible (and when =
they should retry).

Long term, we=E2=80=99d really like to see the power on/off operations =
return a redfish
task so clients could track the power operation vs. the required polling =
and/or boot
event notifications by them now. That timeline for us is out there a bit =
though.

> > - Queue up the power on request and execute it once we reach BMC =
Ready (not sure
> >   what type of response that would be to Redfish clients or what =
error path
> >   looks like if we never reach Ready?)
>=20
> Redfish has async tasks for this exact use case, and we already have =
code to do them.  Alternatively you could just return an error that the =
operation is not possible, along with a retry-after header instructing =
the user when to retry their request.  We do this in the few update apis =
already.

Yep, I like the alternative here medium term.

>=20
> > - Find a way in the client to better detect an unexpected bmc reboot =
(heartbeat
> >   of some sort)
> > - Push bmcweb further in the startup to BMC Ready, ensuring clients =
can't talk
> >   to the BMC until it's near Ready state
>=20
> For your use case, if this is possible, that=E2=80=99s probably =
easiest and most client friendly, so long as you can handle the case =
where the bmc never hits =E2=80=9Cready=E2=80=9D

Possible, but our redfish client does potentially manage a lot of =
systems, so anything that
increases repeated traffic is frowned upon. And since this seems like =
something that could
affect any Redfish client with similar event driven requirements, it =
seems best to ensure
the openbmc back end provides an adequate error in this situation.

>=20
> >
> > Thoughts?
> > Andrew
> --=20
> -Ed


--Apple-Mail=_145D31AA-6C35-460F-A40A-272C15796F39
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 2, 2023, at 7:48 PM, Ed Tanous &lt;<a =
href=3D"mailto:ed@tanous.net" class=3D"">ed@tanous.net</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D""><br class=3D"">
<br class=3D"">
On Tue, May 2, 2023 at 1:49=E2=80=AFPM Andrew Geissler &lt;<a =
href=3D"mailto:geissonator@gmail.com" target=3D"_blank" =
class=3D"">geissonator@gmail.com</a>&gt; wrote:<br class=3D"">
&gt;<br class=3D"">
&gt; That got us brainstorming about some possible solutions:<br =
class=3D"">
&gt; - Write some code in bmcweb to send a =E2=80=9Cbmc state change =
event=E2=80=9D anytime bmcweb<br class=3D"">
&gt;&nbsp; &nbsp;comes up to ensure listening clients know =
=E2=80=9Csomething=E2=80=9D has happened<br class=3D"">
&gt; - Add an optional compile option to bmcweb (or =
PSM/x86-power-control) to require<br class=3D"">
&gt;&nbsp; &nbsp;BMC Ready before issuing chassis or system POST =
requests (return error if not<br class=3D"">
&gt;&nbsp; &nbsp;at Ready)<br class=3D"">
<br class=3D""></div><div class=3D"">
PSM or x86-power-control mods would be my preference.&nbsp; bmcweb =
should not be in charge of business logic.&nbsp; If the system shouldn't =
allow power on while the bmc is in ready state, then the daemons that =
handle power on need to have that as a constraint, otherwise you'd have =
the same problem if a user tried from =
IPMI.</div></div></blockquote><div><br class=3D""></div><div>Thanks for =
the responses guys. I=E2=80=99m going to go down the path of an optional =
config</div><div>option to PSM that will require BMC Ready for chassis =
or host operations. It will</div><div>return a well defined d-bus error =
that bmcweb can look at and return an error</div><div>to the redfish =
client indicating the operation is not possible (and when they should =
retry).</div><div><br class=3D""></div><div>Long term, we=E2=80=99d =
really like to see the power on/off operations return a =
redfish</div><div>task so clients could track the power operation vs. =
the required polling and/or boot</div><div>event notifications by them =
now. That timeline for us is out there a bit though.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">
&gt; - Queue up the power on request and execute it once we reach BMC =
Ready (not sure<br class=3D"">
&gt;&nbsp; &nbsp;what type of response that would be to Redfish clients =
or what error path<br class=3D"">
&gt;&nbsp; &nbsp;looks like if we never reach Ready?)</div><div =
dir=3D"auto" class=3D""><br class=3D""></div><div dir=3D"auto" =
class=3D"">Redfish has async tasks for this exact use case, and we =
already have code to do them.&nbsp; Alternatively you could just return =
an error that the operation is not possible, along with a retry-after =
header instructing the user when to retry their request.&nbsp; We do =
this in the few update apis already.</div></div></blockquote><div><br =
class=3D""></div><div>Yep, I like the alternative here medium =
term.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"auto" class=3D""><br class=3D"">
&gt; - Find a way in the client to better detect an unexpected bmc =
reboot (heartbeat<br class=3D"">
&gt;&nbsp; &nbsp;of some sort)<br class=3D"">
&gt; - Push bmcweb further in the startup to BMC Ready, ensuring clients =
can't talk<br class=3D"">
&gt;&nbsp; &nbsp;to the BMC until it's near Ready state</div><div =
dir=3D"auto" class=3D""><br class=3D""></div><div dir=3D"auto" =
class=3D"">For your use case, if this is possible, that=E2=80=99s =
probably easiest and most client friendly, so long as you can handle the =
case where the bmc never hits =
=E2=80=9Cready=E2=80=9D</div></div></blockquote><div><br =
class=3D""></div><div>Possible, but our redfish client does potentially =
manage a lot of systems, so anything that</div><div>increases repeated =
traffic is frowned upon. And since this seems like something that =
could</div><div>affect any Redfish client with similar event driven =
requirements, it seems best to ensure</div><div>the openbmc back end =
provides an adequate error in this situation.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"auto" class=3D""><br class=3D"">
&gt;<br class=3D"">
&gt; Thoughts?<br class=3D"">
&gt; Andrew<br class=3D"">
</div><span class=3D"gmail_signature_prefix">-- </span><br class=3D""><div=
 dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr" =
class=3D"">-Ed</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_145D31AA-6C35-460F-A40A-272C15796F39--
